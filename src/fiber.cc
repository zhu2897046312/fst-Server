#include "fiber.h"
#include "logger.h"

#include <cassert>
#include <cstdlib>
#include <ucontext.h>

namespace fst{

std::atomic<uint64_t> Fiber::s_fiber_id(0);                 //当前协程
std::atomic<uint64_t> Fiber::s_fiber_count(0);              //协程数
thread_local Fiber* Fiber::t_fiber = nullptr;                   //当前协程
thread_local Fiber::ptr Fiber::t_thread_main_fiber = nullptr;    //线程主协程 

/**
 * 分配栈空间
 */
class MallocStackAllocator {
public:
    static void* Alloc(size_t size) {
        return malloc(size);
    }

    static void Dealloc(void* vp, size_t size) {
        return free(vp);
    }
};

using StackAllocator = MallocStackAllocator;

void Fiber::SetCurrentFiber(Fiber* fiber){
    t_fiber = fiber;
}
/**
 * 获取当前协程
 * 不存在则会创建一个主协程并返回
 */                 
Fiber::ptr Fiber::GetCurrentFiber(){
    if(t_fiber){
        return t_fiber->shared_from_this();
    }
    return CreateMainFiber();
}
/**
 * 创建一个主协程
 */
Fiber::ptr Fiber::CreateMainFiber(){
    Fiber::ptr main_fiber(new Fiber);
    t_thread_main_fiber = main_fiber;
    return t_fiber->shared_from_this();
}

/**
 * 主协程构造
 * 1. 设置协程状态
 * 2. 设置当前协程
 * 3. 获取当前上下文
 * 4. 协程数++
 */
 Fiber::Fiber(){
    m_state = EXEC;

    SetCurrentFiber(this);

    if(getcontext(&m_context)){
        LOG_FATAL("getcontext error!");
        exit(EXIT_FAILURE);
    }

    ++s_fiber_count;

    LOG_DEBUG("Fiber::Fiber main!");
}
/**
 * 子协程构造
 * 1. 协程数++
 * 2. 分配栈空间
 * 3. 获取当前上下文
 * 4. 初始化协程句柄
 */
Fiber::Fiber(std::function<void()> cb, size_t stacksize, bool use_caller)
    : m_fiber_id(++s_fiber_id)
    , m_cb(cb){
    ++s_fiber_count;

    m_stacksize = stacksize;
    m_stack = StackAllocator::Alloc(m_stacksize);
    if(getcontext(&m_context)){
        LOG_FATAL("getcontext error!");
        exit(EXIT_FAILURE);
    }
    m_context.uc_link = nullptr;
    m_context.uc_stack.ss_sp = m_stack;
    m_context.uc_stack.ss_size = m_stacksize;

    // 指明该context入口函数
    if(!use_caller){
        makecontext(&m_context, &MainFunc, 0);
    }else{
        makecontext(&m_context, &CallerMainFunc, 0);
    }

    LOG_DEBUG("Fiber::Fiber id=%d", m_fiber_id);
}
/**
 * 1. 协程数--
 * 2. 当前为子协程 ---> 释放栈空间
 * 3. 为主协程 ---> 没有栈空间 直接将当前协程置空  (因为主协程都要没了，说明已经没有子协程了)
 */
Fiber::~Fiber(){
    --s_fiber_count;
    //子协程
    if(m_stack){
        assert(m_state == TERM ||
            m_state == EXCEPT ||
            m_state == INIT);
        LOG_DEBUG("Fiber::~Fiber sub_state=%d",static_cast<int>(m_state));
        StackAllocator::Dealloc(m_stack, m_stacksize);
        m_stack = nullptr;
    }else{
        assert(!m_cb);
        assert(m_state == EXEC);
        LOG_DEBUG("Fiber::~Fiber main_state=%d",static_cast<int>(m_state));
        //当前协程为主协程
        Fiber* current = t_fiber;
        if(current == this){
            SetCurrentFiber(nullptr);
        }
    }

    LOG_DEBUG("Fiber::~Fiber id=%d total=%d",m_fiber_id, s_fiber_count);
}

void Fiber::reset(std::function<void()> cb){
    //子协程才能使用 并且不在EXEC 和 READY状态才行
    if(m_stack && (m_state == INIT || m_state == TERM || m_state == EXCEPT)){
        m_cb = cb;

        if(getcontext(&m_context)){
            LOG_FATAL("getcontext error!");
            exit(EXIT_FAILURE);
        }
        m_context.uc_link = nullptr;
        m_context.uc_stack.ss_sp = m_stack;
        m_context.uc_stack.ss_size = m_stacksize;

        makecontext(&m_context, &Fiber::MainFunc, 0);
        m_state = INIT;
    }   
}

void Fiber::call(){
    SetCurrentFiber(this);
    m_state = EXEC;
    if(swapcontext(&t_thread_main_fiber->m_context, &m_context)){
        LOG_FATAL("swapcontext error_msg=%d",errno);
        exit(EXIT_FAILURE);
    }
}

void Fiber::back(){
    SetCurrentFiber(t_thread_main_fiber.get());
    //m_state = HOLD;
    if(swapcontext(&m_context, &t_thread_main_fiber->m_context)){
        LOG_FATAL("swapcontext error_msg=%d",errno);
        exit(EXIT_FAILURE);
    }
}

void Fiber::Yield(){
    Fiber::ptr current = GetCurrentFiber();
    current->back();
}


/**
 * 协程执行函数 使用当前线程的上下文
 */
void Fiber::MainFunc(){
     Fiber::ptr cur = GetCurrentFiber();     // GetThis 是默认构造，创建的是主协程，主协程没有cb，就会产生异常所以需要itry catch

    try {
        cur->m_cb();    //执行 函数
        cur->m_cb = nullptr;
        cur->m_state = TERM;    //执行完成
        LOG_ERROR("Fiber cb end");
    } catch (std::exception& ex) {
        cur->m_state = EXCEPT;
        LOG_ERROR("Fiber Except:%s fiber_id=%lu",ex.what(), cur->getId());
    } catch (...) {
        cur->m_state = EXCEPT;
        LOG_ERROR("Fiber Except: fiber_id=%lu", cur->getId());
    }

    auto raw_ptr = cur.get();
    cur.reset();                
    raw_ptr->back();
}
/**
 * 协程执行函数 创建自己的独立的上下文
 */
void Fiber::CallerMainFunc(){
    Fiber::ptr cur = GetCurrentFiber();     // GetThis 是默认构造，创建的是主协程，主协程没有cb，就会产生异常所以需要itry catch

    try {
        cur->m_cb();    //执行 函数
        cur->m_cb = nullptr;
        cur->m_state = TERM;    //执行完成
        LOG_ERROR("Fiber cb end");
    } catch (std::exception& ex) {
        cur->m_state = EXCEPT;
        LOG_ERROR("Fiber Except:%s fiber_id=%lu",ex.what(), cur->getId());
    } catch (...) {
        cur->m_state = EXCEPT;
        LOG_ERROR("Fiber Except: fiber_id=%lu", cur->getId());
    }

    auto raw_ptr = cur.get();
    cur.reset();                
    raw_ptr->back();
}


}