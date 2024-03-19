aux_source_directory(./ SRC_LIST)
add_library(server ${SRC_LIST})
target_include_directories(server PUBLIC ./include)

target_link_libraries(server  pthread)