# Install script for directory: /home/foscar/kmu_virtualdrive2025/src/morai_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/msg" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CtrlCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EgoVehicleStatusExtended.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GPSMessage.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GhostMessage.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusList.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusExtended.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ObjectStatusListExtended.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/TrafficLight.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ERP42Info.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/GetTrafficLightStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SetTrafficLight.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionControl.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntersectionStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/CollisionData.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiEgoSetting.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/IntscnTL.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SensorPosControl.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcHandle.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSimProcStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiSrvResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ScenarioLoad.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLIndex.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MoraiTLInfo.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SaveSensorData.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/ReplayInfo.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/EventInfo.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/Lamps.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpec.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleSpecIndex.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/NpcGhostInfo.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollisionData.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/VehicleCollision.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeAddObject.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeInfo.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTickResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeRemoveObject.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCmdResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WaitForTick.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpec.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MapSpecIndex.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeCtrlCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeSetGear.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeResultResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SyncModeScenarioLoad.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetection.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/RadarDetections.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PRCtrlCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/PREvent.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardCtrlCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkateboardStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SkidSteer6wUGVStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/MultiPlayEventRequest.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmdResponse.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/DillyCmd.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/WoowaDillyStatus.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/SVADC.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Controller.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Response.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Sensor.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultInjection_Tire.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Overall.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Sensor.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/msg/FaultStatusInfo.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/srv" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiScenarioLoadSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSimProcSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiTLInfoSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiEventCmdSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiVehicleSpecSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiWaitForTickSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiMapSpecSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeSLSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/PREventSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/MultiPlayEventSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionCtrlSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionSensorSrv.srv"
    "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/srv/FaultInjectionTireSrv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES "/home/foscar/kmu_virtualdrive2025/build/morai_msgs/catkin_generated/installspace/morai_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/foscar/kmu_virtualdrive2025/devel/include/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/foscar/kmu_virtualdrive2025/devel/share/roseus/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/foscar/kmu_virtualdrive2025/devel/share/common-lisp/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/foscar/kmu_virtualdrive2025/devel/share/gennodejs/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/foscar/kmu_virtualdrive2025/devel/lib/python3/dist-packages/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/foscar/kmu_virtualdrive2025/devel/lib/python3/dist-packages/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/foscar/kmu_virtualdrive2025/build/morai_msgs/catkin_generated/installspace/morai_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES "/home/foscar/kmu_virtualdrive2025/build/morai_msgs/catkin_generated/installspace/morai_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES
    "/home/foscar/kmu_virtualdrive2025/build/morai_msgs/catkin_generated/installspace/morai_msgsConfig.cmake"
    "/home/foscar/kmu_virtualdrive2025/build/morai_msgs/catkin_generated/installspace/morai_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs" TYPE FILE FILES "/home/foscar/kmu_virtualdrive2025/src/morai_msgs/package.xml")
endif()

