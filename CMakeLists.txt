cmake_minimum_required(VERSION 3.0)
project(fstServer)

set(CMAKE_BUILD_TYPE "DEBUG")
set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

# 设置项目可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# 设置编译头文件搜索路径
#include_directories(${PROJECT_SOURCE_DIR}/example)
include_directories(${PROJECT_SOURCE_DIR}/src/include)

# 设置库文件输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
# 设置项目库文件搜索路径
link_directories(${PROJECT_SOURCE_DIR}/lib)
link_directories(/usr/local/lib)

add_subdirectory(src)
add_subdirectory(test)