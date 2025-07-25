# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "morai_msgs: 71 messages, 19 services")

set(MSG_I_FLAGS "-Imorai_msgs:/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(morai_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" "morai_msgs/ObjectStatus:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" "geometry_msgs/Quaternion:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" "std_msgs/Header:geometry_msgs/Quaternion:morai_msgs/ObjectStatusExtended:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" "morai_msgs/ObjectStatus:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" "morai_msgs/ObjectStatus:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" "std_msgs/Header:morai_msgs/Lamps"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" "std_msgs/Header:morai_msgs/NpcGhostInfo:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" "morai_msgs/ObjectStatus:std_msgs/Header:morai_msgs/VehicleCollision:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" "morai_msgs/ObjectStatus:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" "std_msgs/Header:morai_msgs/EgoVehicleStatus:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" "morai_msgs/CtrlCmd"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" "morai_msgs/RadarDetection:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" "morai_msgs/FaultStatusInfo_Sensor:morai_msgs/FaultStatusInfo_Vehicle:morai_msgs/FaultStatusInfo_Overall"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" ""
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" "morai_msgs/FaultStatusInfo_Overall"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" "morai_msgs/FaultStatusInfo_Overall"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" "morai_msgs/FaultStatusInfo_Sensor:std_msgs/Header:morai_msgs/FaultStatusInfo_Vehicle:morai_msgs/FaultStatusInfo_Overall"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" "morai_msgs/MoraiSrvResponse:morai_msgs/ScenarioLoad"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" "morai_msgs/MoraiSrvResponse:morai_msgs/MoraiSimProcHandle"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" "std_msgs/Header:morai_msgs/MoraiTLInfo:morai_msgs/MoraiTLIndex"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" "std_msgs/Header:morai_msgs/EventInfo:morai_msgs/Lamps"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" "morai_msgs/VehicleSpec:morai_msgs/VehicleSpecIndex:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" "morai_msgs/SyncModeCmd:morai_msgs/SyncModeCmdResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" "std_msgs/Header:morai_msgs/EgoVehicleStatus:geometry_msgs/Vector3:morai_msgs/WaitForTick:morai_msgs/WaitForTickResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" "morai_msgs/MapSpec:morai_msgs/MapSpecIndex:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" "morai_msgs/CtrlCmd:morai_msgs/SyncModeCtrlCmd:morai_msgs/SyncModeResultResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" "morai_msgs/SyncModeSetGear:morai_msgs/SyncModeResultResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" "morai_msgs/SyncModeResultResponse:morai_msgs/SyncModeScenarioLoad"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" "morai_msgs/PREvent"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" "morai_msgs/SyncModeResultResponse:morai_msgs/SyncModeAddObject:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" "morai_msgs/SyncModeRemoveObject:morai_msgs/SyncModeResultResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" "morai_msgs/MultiPlayEventResponse:morai_msgs/MultiPlayEventRequest"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" "morai_msgs/DillyCmd:morai_msgs/DillyCmdResponse"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" "morai_msgs/FaultStatusInfo_Vehicle:morai_msgs/FaultInjection_Response:morai_msgs/FaultInjection_Controller:morai_msgs/FaultStatusInfo_Overall:morai_msgs/FaultStatusInfo_Sensor"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" "geometry_msgs/Vector3:morai_msgs/FaultStatusInfo_Vehicle:morai_msgs/FaultInjection_Response:morai_msgs/FaultInjection_Sensor:morai_msgs/FaultStatusInfo_Overall:morai_msgs/FaultStatusInfo_Sensor"
)

get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_custom_target(_morai_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "morai_msgs" "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" "morai_msgs/FaultStatusInfo_Vehicle:morai_msgs/FaultInjection_Response:morai_msgs/FaultStatusInfo_Overall:morai_msgs/FaultInjection_Tire:morai_msgs/FaultStatusInfo_Sensor"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_msg_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)

### Generating Services
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)
_generate_srv_cpp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
)

### Generating Module File
_generate_module_cpp(morai_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(morai_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(morai_msgs_generate_messages morai_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_cpp _morai_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(morai_msgs_gencpp)
add_dependencies(morai_msgs_gencpp morai_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS morai_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_msg_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)

### Generating Services
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)
_generate_srv_eus(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
)

### Generating Module File
_generate_module_eus(morai_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(morai_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(morai_msgs_generate_messages morai_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_eus _morai_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(morai_msgs_geneus)
add_dependencies(morai_msgs_geneus morai_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS morai_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_msg_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)

### Generating Services
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)
_generate_srv_lisp(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
)

### Generating Module File
_generate_module_lisp(morai_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(morai_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(morai_msgs_generate_messages morai_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_lisp _morai_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(morai_msgs_genlisp)
add_dependencies(morai_msgs_genlisp morai_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS morai_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_msg_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)

### Generating Services
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)
_generate_srv_nodejs(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
)

### Generating Module File
_generate_module_nodejs(morai_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(morai_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(morai_msgs_generate_messages morai_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_nodejs _morai_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(morai_msgs_gennodejs)
add_dependencies(morai_msgs_gennodejs morai_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS morai_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_msg_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)

### Generating Services
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)
_generate_srv_py(morai_msgs
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg;/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
)

### Generating Module File
_generate_module_py(morai_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(morai_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(morai_msgs_generate_messages morai_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv" NAME_WE)
add_dependencies(morai_msgs_generate_messages_py _morai_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(morai_msgs_genpy)
add_dependencies(morai_msgs_genpy morai_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS morai_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/morai_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(morai_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(morai_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/morai_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(morai_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(morai_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/morai_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(morai_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(morai_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/morai_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(morai_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(morai_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/morai_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(morai_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(morai_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
