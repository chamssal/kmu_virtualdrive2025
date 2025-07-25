; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude RotaryArray.msg.html

(cl:defclass <RotaryArray> (roslisp-msg-protocol:ros-message)
  ((moving_cars
    :reader moving_cars
    :initarg :moving_cars
    :type (cl:vector obstacle_detect-msg:Rotary)
   :initform (cl:make-array 0 :element-type 'obstacle_detect-msg:Rotary :initial-element (cl:make-instance 'obstacle_detect-msg:Rotary))))
)

(cl:defclass RotaryArray (<RotaryArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotaryArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotaryArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<RotaryArray> is deprecated: use obstacle_detect-msg:RotaryArray instead.")))

(cl:ensure-generic-function 'moving_cars-val :lambda-list '(m))
(cl:defmethod moving_cars-val ((m <RotaryArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:moving_cars-val is deprecated.  Use obstacle_detect-msg:moving_cars instead.")
  (moving_cars m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotaryArray>) ostream)
  "Serializes a message object of type '<RotaryArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'moving_cars))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'moving_cars))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotaryArray>) istream)
  "Deserializes a message object of type '<RotaryArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'moving_cars) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'moving_cars)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'obstacle_detect-msg:Rotary))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotaryArray>)))
  "Returns string type for a message object of type '<RotaryArray>"
  "obstacle_detect/RotaryArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotaryArray)))
  "Returns string type for a message object of type 'RotaryArray"
  "obstacle_detect/RotaryArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotaryArray>)))
  "Returns md5sum for a message object of type '<RotaryArray>"
  "7f4d8ffc9ddc00a08e234a44d62c525f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotaryArray)))
  "Returns md5sum for a message object of type 'RotaryArray"
  "7f4d8ffc9ddc00a08e234a44d62c525f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotaryArray>)))
  "Returns full string definition for message of type '<RotaryArray>"
  (cl:format cl:nil "Rotary[] moving_cars~%~%================================================================================~%MSG: obstacle_detect/Rotary~%float32 dis~%uint8 orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotaryArray)))
  "Returns full string definition for message of type 'RotaryArray"
  (cl:format cl:nil "Rotary[] moving_cars~%~%================================================================================~%MSG: obstacle_detect/Rotary~%float32 dis~%uint8 orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotaryArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'moving_cars) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotaryArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RotaryArray
    (cl:cons ':moving_cars (moving_cars msg))
))
