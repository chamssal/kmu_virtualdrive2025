# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/foscar/kmu_virtualdrive2025/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/foscar/kmu_virtualdrive2025/build

# Include any dependencies generated for this target.
include navigation/navigation/navfn/CMakeFiles/navtest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include navigation/navigation/navfn/CMakeFiles/navtest.dir/compiler_depend.make

# Include the progress variables for this target.
include navigation/navigation/navfn/CMakeFiles/navtest.dir/progress.make

# Include the compile flags for this target's objects.
include navigation/navigation/navfn/CMakeFiles/navtest.dir/flags.make

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o: navigation/navigation/navfn/CMakeFiles/navtest.dir/flags.make
navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o: /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navtest.cpp
navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o: navigation/navigation/navfn/CMakeFiles/navtest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/foscar/kmu_virtualdrive2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o -MF CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o.d -o CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o -c /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navtest.cpp

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/navtest.dir/src/navtest/navtest.cpp.i"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navtest.cpp > CMakeFiles/navtest.dir/src/navtest/navtest.cpp.i

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/navtest.dir/src/navtest/navtest.cpp.s"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navtest.cpp -o CMakeFiles/navtest.dir/src/navtest/navtest.cpp.s

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o: navigation/navigation/navfn/CMakeFiles/navtest.dir/flags.make
navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o: /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navwin.cpp
navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o: navigation/navigation/navfn/CMakeFiles/navtest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/foscar/kmu_virtualdrive2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o -MF CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o.d -o CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o -c /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navwin.cpp

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/navtest.dir/src/navtest/navwin.cpp.i"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navwin.cpp > CMakeFiles/navtest.dir/src/navtest/navwin.cpp.i

navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/navtest.dir/src/navtest/navwin.cpp.s"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn/src/navtest/navwin.cpp -o CMakeFiles/navtest.dir/src/navtest/navwin.cpp.s

# Object files for target navtest
navtest_OBJECTS = \
"CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o" \
"CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o"

# External object files for target navtest
navtest_EXTERNAL_OBJECTS =

/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navtest.cpp.o
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: navigation/navigation/navfn/CMakeFiles/navtest.dir/src/navtest/navwin.cpp.o
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: navigation/navigation/navfn/CMakeFiles/navtest.dir/build.make
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /home/foscar/kmu_virtualdrive2025/devel/lib/libnavfn.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libfltk_gl.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libGL.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libfltk.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libSM.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libICE.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libX11.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libXext.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libm.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /home/foscar/kmu_virtualdrive2025/devel/lib/liblayers.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /home/foscar/kmu_virtualdrive2025/devel/lib/libcostmap_2d.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/liborocos-kdl.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/liblaser_geometry.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libtf.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /home/foscar/kmu_virtualdrive2025/devel/lib/libvoxel_grid.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libclass_loader.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libdl.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libroslib.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/librospack.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libtf2_ros.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libactionlib.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libmessage_filters.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libroscpp.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/librosconsole.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libtf2.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/librostime.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /opt/ros/noetic/lib/libcpp_common.so
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest: navigation/navigation/navfn/CMakeFiles/navtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/foscar/kmu_virtualdrive2025/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable /home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest"
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/navtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navigation/navigation/navfn/CMakeFiles/navtest.dir/build: /home/foscar/kmu_virtualdrive2025/devel/lib/navfn/navtest
.PHONY : navigation/navigation/navfn/CMakeFiles/navtest.dir/build

navigation/navigation/navfn/CMakeFiles/navtest.dir/clean:
	cd /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn && $(CMAKE_COMMAND) -P CMakeFiles/navtest.dir/cmake_clean.cmake
.PHONY : navigation/navigation/navfn/CMakeFiles/navtest.dir/clean

navigation/navigation/navfn/CMakeFiles/navtest.dir/depend:
	cd /home/foscar/kmu_virtualdrive2025/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/foscar/kmu_virtualdrive2025/src /home/foscar/kmu_virtualdrive2025/src/navigation/navigation/navfn /home/foscar/kmu_virtualdrive2025/build /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn /home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn/CMakeFiles/navtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navigation/navigation/navfn/CMakeFiles/navtest.dir/depend

