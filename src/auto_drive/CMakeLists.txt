cmake_minimum_required(VERSION 3.0.2)
project(auto_drive)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  sensor_msgs
  geometry_msgs
  visualization_msgs
  cv_bridge
)

catkin_package()

catkin_install_python(PROGRAMS
  scripts/lane_follower.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
