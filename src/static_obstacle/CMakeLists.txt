cmake_minimum_required(VERSION 3.0.2)
project(static_obstacle)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  obstacle_msgs
)

catkin_package()

include_directories(${catkin_INCLUDE_DIRS})

catkin_install_python(PROGRAMS
  src/static_obstacle.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
