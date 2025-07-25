; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude LidarObstacleInfo.msg.html

(cl:defclass <LidarObstacleInfo> (roslisp-msg-protocol:ros-message)
  ((obst_x
    :reader obst_x
    :initarg :obst_x
    :type cl:float
    :initform 0.0)
   (obst_y
    :reader obst_y
    :initarg :obst_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass LidarObstacleInfo (<LidarObstacleInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LidarObstacleInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LidarObstacleInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<LidarObstacleInfo> is deprecated: use obstacle_detect-msg:LidarObstacleInfo instead.")))

(cl:ensure-generic-function 'obst_x-val :lambda-list '(m))
(cl:defmethod obst_x-val ((m <LidarObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:obst_x-val is deprecated.  Use obstacle_detect-msg:obst_x instead.")
  (obst_x m))

(cl:ensure-generic-function 'obst_y-val :lambda-list '(m))
(cl:defmethod obst_y-val ((m <LidarObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:obst_y-val is deprecated.  Use obstacle_detect-msg:obst_y instead.")
  (obst_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LidarObstacleInfo>) ostream)
  "Serializes a message object of type '<LidarObstacleInfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obst_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obst_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LidarObstacleInfo>) istream)
  "Deserializes a message object of type '<LidarObstacleInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obst_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obst_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LidarObstacleInfo>)))
  "Returns string type for a message object of type '<LidarObstacleInfo>"
  "obstacle_detect/LidarObstacleInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LidarObstacleInfo)))
  "Returns string type for a message object of type 'LidarObstacleInfo"
  "obstacle_detect/LidarObstacleInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LidarObstacleInfo>)))
  "Returns md5sum for a message object of type '<LidarObstacleInfo>"
  "29acf9247b80e40f99626c6dd6c9f858")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LidarObstacleInfo)))
  "Returns md5sum for a message object of type 'LidarObstacleInfo"
  "29acf9247b80e40f99626c6dd6c9f858")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LidarObstacleInfo>)))
  "Returns full string definition for message of type '<LidarObstacleInfo>"
  (cl:format cl:nil "float32 obst_x~%float32 obst_y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LidarObstacleInfo)))
  "Returns full string definition for message of type 'LidarObstacleInfo"
  (cl:format cl:nil "float32 obst_x~%float32 obst_y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LidarObstacleInfo>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LidarObstacleInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'LidarObstacleInfo
    (cl:cons ':obst_x (obst_x msg))
    (cl:cons ':obst_y (obst_y msg))
))
