set(SRC_THREAD_TEST thread_test.cc)
set(SRC_TFIBER_TEST fiber_test.cc)

add_executable(thread_test ${SRC_THREAD_TEST})
add_executable(fiber_test ${SRC_TFIBER_TEST})

target_link_libraries(thread_test server)
target_link_libraries(fiber_test server)

