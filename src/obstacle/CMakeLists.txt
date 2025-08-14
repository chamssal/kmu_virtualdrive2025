cmake_minimum_required(VERSION 3.0.2)
project(obstacle)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  nav_msgs
  geometry_msgs
  tf
)

# add_message_files(FILES ObstacleDecision.msg)
# generate_messages(DEPENDENCIES std_msgs)

catkin_package(
  # CATKIN_DEPENDS message_runtime  # .msg 정의할 때만 사용
)

catkin_install_python(PROGRAMS
  src/obstacle_viz_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)


include_directories(${catkin_INCLUDE_DIRS})
