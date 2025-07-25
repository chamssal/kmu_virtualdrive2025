// Auto-generated. Do not edit!

// (in-package obstacle_detect.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LidarObstacleInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obst_x = null;
      this.obst_y = null;
    }
    else {
      if (initObj.hasOwnProperty('obst_x')) {
        this.obst_x = initObj.obst_x
      }
      else {
        this.obst_x = 0.0;
      }
      if (initObj.hasOwnProperty('obst_y')) {
        this.obst_y = initObj.obst_y
      }
      else {
        this.obst_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LidarObstacleInfo
    // Serialize message field [obst_x]
    bufferOffset = _serializer.float32(obj.obst_x, buffer, bufferOffset);
    // Serialize message field [obst_y]
    bufferOffset = _serializer.float32(obj.obst_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LidarObstacleInfo
    let len;
    let data = new LidarObstacleInfo(null);
    // Deserialize message field [obst_x]
    data.obst_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [obst_y]
    data.obst_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'obstacle_detect/LidarObstacleInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '29acf9247b80e40f99626c6dd6c9f858';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 obst_x
    float32 obst_y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LidarObstacleInfo(null);
    if (msg.obst_x !== undefined) {
      resolved.obst_x = msg.obst_x;
    }
    else {
      resolved.obst_x = 0.0
    }

    if (msg.obst_y !== undefined) {
      resolved.obst_y = msg.obst_y;
    }
    else {
      resolved.obst_y = 0.0
    }

    return resolved;
    }
};

module.exports = LidarObstacleInfo;
