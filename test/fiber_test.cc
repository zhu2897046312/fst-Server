#include "fiber.h"
#include "logger.h"
#include "thread.h"

void run_in_fiber(){
    LOG_INFO("run_in_fiber begin");
    fst::Fiber::Yield();
    LOG_INFO("run_in_fiber end");
    fst::Fiber::Yield();
}

void test_fiber(){
    LOG_INFO("main after begin -l");
    {
        fst::Fiber::GetCurrentFiber();
        LOG_INFO("main after begin");
        fst::Fiber::ptr fiber(new fst::Fiber(run_in_fiber,128 * 1024));
        fiber->call();
        LOG_INFO("main after swapIn");
        fiber->call();
        LOG_INFO("main after end");
        fiber->call();
    }
    LOG_INFO("main after end -l");
}

int main(){
    for(int i = 0; i < 3; i++){
        fst::Thread thread(std::bind(&test_fiber),"thread" + std::to_string(i));
        thread.start();
    }
    
    return 0;
}