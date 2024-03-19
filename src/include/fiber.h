#pragma once

#include <memory>
#include <functional>
#include <sys/ucontext.h>
#include <ucontext.h>
#include <atomic>
#include <cstdlib>

namespace fst {

class Fiber : public std::enable_shared_from_this<Fiber>  
{
public:
    using ptr = std::shared_ptr<Fiber>;
    enum State{
        INIT,
        HOLD,
        EXEC,
        TERM,
        READY,
        EXCEPT
    };
    /**
     * 子协程构造
     * 1. 协程数++ 
     * 2. 分配栈空间
     * 3. 获取当前上下文
     * 4. 初始化协程句柄    
     * use_caller = true 使用当前线程的上下文作为自己的上下文
     *            = false 创建自己的独立的上下文，不依赖于调用者的上下文
     */
    Fiber(std::function<void()> cb, size_t stacksize = 0, bool use_caller = false);
    /**
     * 主协程构造
     * 1. 设置协程状态
     * 2. 设置当前协程
     * 3. 获取当前上下文
     * 4. 协程数++
     */
    ~Fiber();
    uint64_t getId() const { return m_fiber_id;}
    State getState() const { return m_state;}
    /**
     * 重置协程
     */
    void reset(std::function<void()> cb);
    /**
     * 从主协程切换到当前协程
     */
    void call();
    /**
     * 从当前协程切换到主协程
     */
    void back();
public:
    /**
     * 设置当前协程
     */
    static void SetCurrentFiber(Fiber* f); 
    /**
     * 获取当前协程 
     */              
    static Fiber::ptr GetCurrentFiber();
    /**
     * 创建主协程
     */                    
    static Fiber::ptr CreateMainFiber();
    /**
     * 协程执行函数 使用当前线程的上下文
     */
    static void MainFunc();
    /**
     * 协程执行函数 创建自己的独立的上下文
     */
    static void CallerMainFunc();

    static void Yield();
private:
    Fiber();
private:
    State m_state = INIT;       //协程状态
    uint64_t m_fiber_id = 0;    //协程id
    uint32_t m_stacksize = 0;   //协程执行栈大小
    ucontext_t m_context;       //上下文
    void* m_stack = nullptr;    //执行栈
    std::function<void()> m_cb; //协程执行回调函数

    static std::atomic<uint64_t> s_fiber_id;        //当前协程
    static std::atomic<uint64_t> s_fiber_count;     //协程数
    static thread_local Fiber* t_fiber;             //当前协程
    static thread_local Fiber::ptr t_thread_main_fiber;   //主协程
};

}