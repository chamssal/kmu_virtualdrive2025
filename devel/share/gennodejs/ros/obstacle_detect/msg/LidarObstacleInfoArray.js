// Auto-generated. Do not edit!

// (in-package obstacle_detect.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LidarObstacleInfo = require('./LidarObstacleInfo.js');

//-----------------------------------------------------------

class LidarObstacleInfoArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obstacle_infos = null;
    }
    else {
      if (initObj.hasOwnProperty('obstacle_infos')) {
        this.obstacle_infos = initObj.obstacle_infos
      }
      else {
        this.obstacle_infos = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LidarObstacleInfoArray
    // Serialize message field [obstacle_infos]
    // Serialize the length for message field [obstacle_infos]
    bufferOffset = _serializer.uint32(obj.obstacle_infos.length, buffer, bufferOffset);
    obj.obstacle_infos.forEach((val) => {
      bufferOffset = LidarObstacleInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LidarObstacleInfoArray
    let len;
    let data = new LidarObstacleInfoArray(null);
    // Deserialize message field [obstacle_infos]
    // Deserialize array length for message field [obstacle_infos]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle_infos = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle_infos[i] = LidarObstacleInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.obstacle_infos.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'obstacle_detect/LidarObstacleInfoArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '55f01341e34384ade81bbed242fb4d66';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    LidarObstacleInfo[] obstacle_infos
    ================================================================================
    MSG: obstacle_detect/LidarObstacleInfo
    float32 obst_x
    float32 obst_y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LidarObstacleInfoArray(null);
    if (msg.obstacle_infos !== undefined) {
      resolved.obstacle_infos = new Array(msg.obstacle_infos.length);
      for (let i = 0; i < resolved.obstacle_infos.length; ++i) {
        resolved.obstacle_infos[i] = LidarObstacleInfo.Resolve(msg.obstacle_infos[i]);
      }
    }
    else {
      resolved.obstacle_infos = []
    }

    return resolved;
    }
};

module.exports = LidarObstacleInfoArray;
