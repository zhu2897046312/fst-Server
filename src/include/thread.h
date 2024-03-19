#pragma once

#include "noncopyable.h"
#include <atomic>
#include <cstdint>
#include <functional>
#include <memory>
#include <sys/types.h>
#include <thread>
#include <string>
#include <semaphore.h>
namespace fst {

pid_t GetCurrentThreadId();

class Semaphore : noncopyable {
public:
    Semaphore(uint32_t count = 0);
    ~Semaphore();

    void wait();
    void notify();
private:
    sem_t m_semaphore;
};

class Thread : noncopyable
{
public:
    using ptr = std::shared_ptr<Thread>;
    using ThreadFunc = std::function<void()>;
    explicit Thread(ThreadFunc, const std::string &name = "");
    ~Thread();

    void start();
    void join();

    static Thread* GetThis();
    inline bool isStarted() const { return m_started; }
    inline pid_t getThreadId() const { return m_thread_id; }
    inline const std::string& getName() const { return m_thread_name; }

    inline static int getThreadNumber() { return m_thread_cout; }

private:
    std::shared_ptr<std::thread> m_thread;   //线程结构
    pid_t m_thread_id;
    ThreadFunc m_cb;                       //线程回调
    std::string m_thread_name;
    static std::atomic_int m_thread_cout;
    static thread_local Thread* t_thread;

    bool m_started;
    bool m_joined;
};


}


