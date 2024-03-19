#include "thread.h"
#include <string>
#include <stdexcept>
#include <thread>
#include <unistd.h>
#include <sys/syscall.h>

namespace fst {

static thread_local pid_t t_cachedTid = 0;

void cacheTid();

pid_t GetCurrentThreadId(){
    if(__builtin_expect(t_cachedTid == 0, 0)){
        cacheTid();
    }
    return t_cachedTid;
}

void cacheTid(){
    if(t_cachedTid == 0){
        t_cachedTid = static_cast<pid_t>(::syscall(SYS_gettid));
    }
}

//当前线程实例 -- 每个线程都有一份
std::atomic_int Thread::m_thread_cout(0);
thread_local Thread* Thread::t_thread = nullptr;

Semaphore::Semaphore(uint32_t count) {
    if(sem_init(&m_semaphore, 0, count)) {
        throw std::logic_error("sem_init error");
    }
}

Semaphore::~Semaphore() {
    sem_destroy(&m_semaphore);
}

void Semaphore::wait() { //-1
    if(sem_wait(&m_semaphore)) {
        throw std::logic_error("sem_wait error");
    }
}

void Semaphore::notify() { //+1
    if(sem_post(&m_semaphore)) {
        throw std::logic_error("sem_post error");
    }
}

Thread::Thread(ThreadFunc cb, const std::string &name)
    : m_started(false)
    , m_joined(false)
    , m_cb(std::move(cb))
    , m_thread_id(0)
    , m_thread_name(name){
    ++m_thread_cout;
}

Thread::~Thread(){
    if(m_started && !m_joined){
        m_thread->detach();
    }
}

void Thread::join(){
    m_joined = true;
    m_thread->join();
}

void Thread::start(){
    m_started = true;
    Semaphore sem;
    m_thread = std::shared_ptr<std::thread>(new std::thread([&](){
        t_thread = this;
        m_thread_id = GetCurrentThreadId();
        sem.notify();
        
        m_cb();
    }));

    sem.wait();
}

Thread* Thread::GetThis(){
    return t_thread;
}

}