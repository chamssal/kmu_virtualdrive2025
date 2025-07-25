// Auto-generated. Do not edit!

// (in-package obstacle_detect.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Rotary = require('./Rotary.js');

//-----------------------------------------------------------

class RotaryArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.moving_cars = null;
    }
    else {
      if (initObj.hasOwnProperty('moving_cars')) {
        this.moving_cars = initObj.moving_cars
      }
      else {
        this.moving_cars = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RotaryArray
    // Serialize message field [moving_cars]
    // Serialize the length for message field [moving_cars]
    bufferOffset = _serializer.uint32(obj.moving_cars.length, buffer, bufferOffset);
    obj.moving_cars.forEach((val) => {
      bufferOffset = Rotary.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RotaryArray
    let len;
    let data = new RotaryArray(null);
    // Deserialize message field [moving_cars]
    // Deserialize array length for message field [moving_cars]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.moving_cars = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.moving_cars[i] = Rotary.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 5 * object.moving_cars.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'obstacle_detect/RotaryArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7f4d8ffc9ddc00a08e234a44d62c525f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Rotary[] moving_cars
    
    ================================================================================
    MSG: obstacle_detect/Rotary
    float32 dis
    uint8 orientation
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RotaryArray(null);
    if (msg.moving_cars !== undefined) {
      resolved.moving_cars = new Array(msg.moving_cars.length);
      for (let i = 0; i < resolved.moving_cars.length; ++i) {
        resolved.moving_cars[i] = Rotary.Resolve(msg.moving_cars[i]);
      }
    }
    else {
      resolved.moving_cars = []
    }

    return resolved;
    }
};

module.exports = RotaryArray;
