# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhuyi/桌面/WorkSpace/fst-Server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhuyi/桌面/WorkSpace/fst-Server/build

# Include any dependencies generated for this target.
include src/CMakeFiles/server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/server.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/server.dir/flags.make

src/CMakeFiles/server.dir/fiber.cc.o: src/CMakeFiles/server.dir/flags.make
src/CMakeFiles/server.dir/fiber.cc.o: ../src/fiber.cc
src/CMakeFiles/server.dir/fiber.cc.o: src/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhuyi/桌面/WorkSpace/fst-Server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/server.dir/fiber.cc.o"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/server.dir/fiber.cc.o -MF CMakeFiles/server.dir/fiber.cc.o.d -o CMakeFiles/server.dir/fiber.cc.o -c /home/zhuyi/桌面/WorkSpace/fst-Server/src/fiber.cc

src/CMakeFiles/server.dir/fiber.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/fiber.cc.i"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhuyi/桌面/WorkSpace/fst-Server/src/fiber.cc > CMakeFiles/server.dir/fiber.cc.i

src/CMakeFiles/server.dir/fiber.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/fiber.cc.s"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhuyi/桌面/WorkSpace/fst-Server/src/fiber.cc -o CMakeFiles/server.dir/fiber.cc.s

src/CMakeFiles/server.dir/logger.cc.o: src/CMakeFiles/server.dir/flags.make
src/CMakeFiles/server.dir/logger.cc.o: ../src/logger.cc
src/CMakeFiles/server.dir/logger.cc.o: src/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhuyi/桌面/WorkSpace/fst-Server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/server.dir/logger.cc.o"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/server.dir/logger.cc.o -MF CMakeFiles/server.dir/logger.cc.o.d -o CMakeFiles/server.dir/logger.cc.o -c /home/zhuyi/桌面/WorkSpace/fst-Server/src/logger.cc

src/CMakeFiles/server.dir/logger.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/logger.cc.i"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhuyi/桌面/WorkSpace/fst-Server/src/logger.cc > CMakeFiles/server.dir/logger.cc.i

src/CMakeFiles/server.dir/logger.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/logger.cc.s"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhuyi/桌面/WorkSpace/fst-Server/src/logger.cc -o CMakeFiles/server.dir/logger.cc.s

src/CMakeFiles/server.dir/tamestamp.cc.o: src/CMakeFiles/server.dir/flags.make
src/CMakeFiles/server.dir/tamestamp.cc.o: ../src/tamestamp.cc
src/CMakeFiles/server.dir/tamestamp.cc.o: src/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhuyi/桌面/WorkSpace/fst-Server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/server.dir/tamestamp.cc.o"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/server.dir/tamestamp.cc.o -MF CMakeFiles/server.dir/tamestamp.cc.o.d -o CMakeFiles/server.dir/tamestamp.cc.o -c /home/zhuyi/桌面/WorkSpace/fst-Server/src/tamestamp.cc

src/CMakeFiles/server.dir/tamestamp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/tamestamp.cc.i"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhuyi/桌面/WorkSpace/fst-Server/src/tamestamp.cc > CMakeFiles/server.dir/tamestamp.cc.i

src/CMakeFiles/server.dir/tamestamp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/tamestamp.cc.s"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhuyi/桌面/WorkSpace/fst-Server/src/tamestamp.cc -o CMakeFiles/server.dir/tamestamp.cc.s

src/CMakeFiles/server.dir/thread.cc.o: src/CMakeFiles/server.dir/flags.make
src/CMakeFiles/server.dir/thread.cc.o: ../src/thread.cc
src/CMakeFiles/server.dir/thread.cc.o: src/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhuyi/桌面/WorkSpace/fst-Server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/server.dir/thread.cc.o"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/server.dir/thread.cc.o -MF CMakeFiles/server.dir/thread.cc.o.d -o CMakeFiles/server.dir/thread.cc.o -c /home/zhuyi/桌面/WorkSpace/fst-Server/src/thread.cc

src/CMakeFiles/server.dir/thread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/thread.cc.i"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhuyi/桌面/WorkSpace/fst-Server/src/thread.cc > CMakeFiles/server.dir/thread.cc.i

src/CMakeFiles/server.dir/thread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/thread.cc.s"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhuyi/桌面/WorkSpace/fst-Server/src/thread.cc -o CMakeFiles/server.dir/thread.cc.s

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/fiber.cc.o" \
"CMakeFiles/server.dir/logger.cc.o" \
"CMakeFiles/server.dir/tamestamp.cc.o" \
"CMakeFiles/server.dir/thread.cc.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

../lib/libserver.a: src/CMakeFiles/server.dir/fiber.cc.o
../lib/libserver.a: src/CMakeFiles/server.dir/logger.cc.o
../lib/libserver.a: src/CMakeFiles/server.dir/tamestamp.cc.o
../lib/libserver.a: src/CMakeFiles/server.dir/thread.cc.o
../lib/libserver.a: src/CMakeFiles/server.dir/build.make
../lib/libserver.a: src/CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhuyi/桌面/WorkSpace/fst-Server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../../lib/libserver.a"
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean_target.cmake
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/server.dir/build: ../lib/libserver.a
.PHONY : src/CMakeFiles/server.dir/build

src/CMakeFiles/server.dir/clean:
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build/src && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/server.dir/clean

src/CMakeFiles/server.dir/depend:
	cd /home/zhuyi/桌面/WorkSpace/fst-Server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhuyi/桌面/WorkSpace/fst-Server /home/zhuyi/桌面/WorkSpace/fst-Server/src /home/zhuyi/桌面/WorkSpace/fst-Server/build /home/zhuyi/桌面/WorkSpace/fst-Server/build/src /home/zhuyi/桌面/WorkSpace/fst-Server/build/src/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/server.dir/depend

