
"use strict";

let MoraiTLIndex = require('./MoraiTLIndex.js');
let FaultInjection_Sensor = require('./FaultInjection_Sensor.js');
let SyncModeRemoveObject = require('./SyncModeRemoveObject.js');
let IntersectionControl = require('./IntersectionControl.js');
let ObjectStatusExtended = require('./ObjectStatusExtended.js');
let FaultStatusInfo_Vehicle = require('./FaultStatusInfo_Vehicle.js');
let ReplayInfo = require('./ReplayInfo.js');
let SyncModeScenarioLoad = require('./SyncModeScenarioLoad.js');
let EventInfo = require('./EventInfo.js');
let EgoVehicleStatus = require('./EgoVehicleStatus.js');
let PRCtrlCmd = require('./PRCtrlCmd.js');
let DdCtrlCmd = require('./DdCtrlCmd.js');
let EgoDdVehicleStatus = require('./EgoDdVehicleStatus.js');
let SaveSensorData = require('./SaveSensorData.js');
let SyncModeCmdResponse = require('./SyncModeCmdResponse.js');
let Lamps = require('./Lamps.js');
let MapSpecIndex = require('./MapSpecIndex.js');
let MoraiTLInfo = require('./MoraiTLInfo.js');
let FaultStatusInfo = require('./FaultStatusInfo.js');
let SensorPosControl = require('./SensorPosControl.js');
let PREvent = require('./PREvent.js');
let SyncModeInfo = require('./SyncModeInfo.js');
let FaultInjection_Controller = require('./FaultInjection_Controller.js');
let SVADC = require('./SVADC.js');
let RadarDetection = require('./RadarDetection.js');
let FaultInjection_Response = require('./FaultInjection_Response.js');
let SetTrafficLight = require('./SetTrafficLight.js');
let ScenarioLoad = require('./ScenarioLoad.js');
let CtrlCmd = require('./CtrlCmd.js');
let VehicleCollisionData = require('./VehicleCollisionData.js');
let GetTrafficLightStatus = require('./GetTrafficLightStatus.js');
let IntersectionStatus = require('./IntersectionStatus.js');
let WaitForTick = require('./WaitForTick.js');
let WoowaDillyStatus = require('./WoowaDillyStatus.js');
let SyncModeAddObject = require('./SyncModeAddObject.js');
let MultiPlayEventRequest = require('./MultiPlayEventRequest.js');
let RadarDetections = require('./RadarDetections.js');
let SkidSteer6wUGVCtrlCmd = require('./SkidSteer6wUGVCtrlCmd.js');
let MapSpec = require('./MapSpec.js');
let ObjectStatus = require('./ObjectStatus.js');
let ObjectStatusList = require('./ObjectStatusList.js');
let VehicleSpecIndex = require('./VehicleSpecIndex.js');
let TrafficLight = require('./TrafficLight.js');
let SyncModeCmd = require('./SyncModeCmd.js');
let ObjectStatusListExtended = require('./ObjectStatusListExtended.js');
let NpcGhostCmd = require('./NpcGhostCmd.js');
let DillyCmdResponse = require('./DillyCmdResponse.js');
let SyncModeResultResponse = require('./SyncModeResultResponse.js');
let EgoVehicleStatusExtended = require('./EgoVehicleStatusExtended.js');
let MoraiSimProcStatus = require('./MoraiSimProcStatus.js');
let SyncModeSetGear = require('./SyncModeSetGear.js');
let FaultInjection_Tire = require('./FaultInjection_Tire.js');
let IntscnTL = require('./IntscnTL.js');
let SkidSteer6wUGVStatus = require('./SkidSteer6wUGVStatus.js');
let MoraiSrvResponse = require('./MoraiSrvResponse.js');
let SkateboardStatus = require('./SkateboardStatus.js');
let SyncModeCtrlCmd = require('./SyncModeCtrlCmd.js');
let WaitForTickResponse = require('./WaitForTickResponse.js');
let CollisionData = require('./CollisionData.js');
let MoraiSimProcHandle = require('./MoraiSimProcHandle.js');
let PRStatus = require('./PRStatus.js');
let NpcGhostInfo = require('./NpcGhostInfo.js');
let SkateboardCtrlCmd = require('./SkateboardCtrlCmd.js');
let VehicleSpec = require('./VehicleSpec.js');
let GPSMessage = require('./GPSMessage.js');
let GhostMessage = require('./GhostMessage.js');
let FaultStatusInfo_Sensor = require('./FaultStatusInfo_Sensor.js');
let ERP42Info = require('./ERP42Info.js');
let VehicleCollision = require('./VehicleCollision.js');
let MultiPlayEventResponse = require('./MultiPlayEventResponse.js');
let DillyCmd = require('./DillyCmd.js');
let FaultStatusInfo_Overall = require('./FaultStatusInfo_Overall.js');
let MultiEgoSetting = require('./MultiEgoSetting.js');

module.exports = {
  MoraiTLIndex: MoraiTLIndex,
  FaultInjection_Sensor: FaultInjection_Sensor,
  SyncModeRemoveObject: SyncModeRemoveObject,
  IntersectionControl: IntersectionControl,
  ObjectStatusExtended: ObjectStatusExtended,
  FaultStatusInfo_Vehicle: FaultStatusInfo_Vehicle,
  ReplayInfo: ReplayInfo,
  SyncModeScenarioLoad: SyncModeScenarioLoad,
  EventInfo: EventInfo,
  EgoVehicleStatus: EgoVehicleStatus,
  PRCtrlCmd: PRCtrlCmd,
  DdCtrlCmd: DdCtrlCmd,
  EgoDdVehicleStatus: EgoDdVehicleStatus,
  SaveSensorData: SaveSensorData,
  SyncModeCmdResponse: SyncModeCmdResponse,
  Lamps: Lamps,
  MapSpecIndex: MapSpecIndex,
  MoraiTLInfo: MoraiTLInfo,
  FaultStatusInfo: FaultStatusInfo,
  SensorPosControl: SensorPosControl,
  PREvent: PREvent,
  SyncModeInfo: SyncModeInfo,
  FaultInjection_Controller: FaultInjection_Controller,
  SVADC: SVADC,
  RadarDetection: RadarDetection,
  FaultInjection_Response: FaultInjection_Response,
  SetTrafficLight: SetTrafficLight,
  ScenarioLoad: ScenarioLoad,
  CtrlCmd: CtrlCmd,
  VehicleCollisionData: VehicleCollisionData,
  GetTrafficLightStatus: GetTrafficLightStatus,
  IntersectionStatus: IntersectionStatus,
  WaitForTick: WaitForTick,
  WoowaDillyStatus: WoowaDillyStatus,
  SyncModeAddObject: SyncModeAddObject,
  MultiPlayEventRequest: MultiPlayEventRequest,
  RadarDetections: RadarDetections,
  SkidSteer6wUGVCtrlCmd: SkidSteer6wUGVCtrlCmd,
  MapSpec: MapSpec,
  ObjectStatus: ObjectStatus,
  ObjectStatusList: ObjectStatusList,
  VehicleSpecIndex: VehicleSpecIndex,
  TrafficLight: TrafficLight,
  SyncModeCmd: SyncModeCmd,
  ObjectStatusListExtended: ObjectStatusListExtended,
  NpcGhostCmd: NpcGhostCmd,
  DillyCmdResponse: DillyCmdResponse,
  SyncModeResultResponse: SyncModeResultResponse,
  EgoVehicleStatusExtended: EgoVehicleStatusExtended,
  MoraiSimProcStatus: MoraiSimProcStatus,
  SyncModeSetGear: SyncModeSetGear,
  FaultInjection_Tire: FaultInjection_Tire,
  IntscnTL: IntscnTL,
  SkidSteer6wUGVStatus: SkidSteer6wUGVStatus,
  MoraiSrvResponse: MoraiSrvResponse,
  SkateboardStatus: SkateboardStatus,
  SyncModeCtrlCmd: SyncModeCtrlCmd,
  WaitForTickResponse: WaitForTickResponse,
  CollisionData: CollisionData,
  MoraiSimProcHandle: MoraiSimProcHandle,
  PRStatus: PRStatus,
  NpcGhostInfo: NpcGhostInfo,
  SkateboardCtrlCmd: SkateboardCtrlCmd,
  VehicleSpec: VehicleSpec,
  GPSMessage: GPSMessage,
  GhostMessage: GhostMessage,
  FaultStatusInfo_Sensor: FaultStatusInfo_Sensor,
  ERP42Info: ERP42Info,
  VehicleCollision: VehicleCollision,
  MultiPlayEventResponse: MultiPlayEventResponse,
  DillyCmd: DillyCmd,
  FaultStatusInfo_Overall: FaultStatusInfo_Overall,
  MultiEgoSetting: MultiEgoSetting,
};
