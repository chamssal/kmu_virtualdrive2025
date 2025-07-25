# Install script for directory: /home/foscar/kmu_virtualdrive2025/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/foscar/kmu_virtualdrive2025/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE PROGRAM FILES "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE PROGRAM FILES "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/setup.bash;/home/foscar/kmu_virtualdrive2025/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/setup.bash"
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/setup.sh;/home/foscar/kmu_virtualdrive2025/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/setup.sh"
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/setup.zsh;/home/foscar/kmu_virtualdrive2025/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/setup.zsh"
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/setup.fish;/home/foscar/kmu_virtualdrive2025/install/local_setup.fish")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/setup.fish"
    "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/local_setup.fish"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/foscar/kmu_virtualdrive2025/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/foscar/kmu_virtualdrive2025/install" TYPE FILE FILES "/home/foscar/kmu_virtualdrive2025/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/foscar/kmu_virtualdrive2025/build/gtest/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navigation/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/openslam_gmapping/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/racecar/racecar/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/slam_gmapping/slam_gmapping/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/ackermann_msgs/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/morai_msgs/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/vesc/vesc/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/wecar_msgs/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/obstacle_detect/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/map_server/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/racecar/ackermann_cmd_mux/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/auto_drive/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/slam_gmapping/gmapping/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/amcl/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/fake_localization/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/robot_localization/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/learning_tf/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/vesc/vesc_ackermann/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/vesc/vesc_driver/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/voxel_grid/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/costmap_2d/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/nav_core/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/base_local_planner/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/carrot_planner/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/clear_costmap_recovery/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/dwa_local_planner/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/move_slow_and_clear/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/navfn/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/global_planner/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/rotate_recovery/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/navigation/navigation/move_base/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/teb_local_planner/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/wecar_ros/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/wego/cmake_install.cmake")
  include("/home/foscar/kmu_virtualdrive2025/build/wego_2d_nav/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/foscar/kmu_virtualdrive2025/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
