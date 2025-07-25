; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude ObstacleInfo.msg.html

(cl:defclass <ObstacleInfo> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (is_dynamic
    :reader is_dynamic
    :initarg :is_dynamic
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ObstacleInfo (<ObstacleInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<ObstacleInfo> is deprecated: use obstacle_detect-msg:ObstacleInfo instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:distance-val is deprecated.  Use obstacle_detect-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:x-val is deprecated.  Use obstacle_detect-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:y-val is deprecated.  Use obstacle_detect-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'is_dynamic-val :lambda-list '(m))
(cl:defmethod is_dynamic-val ((m <ObstacleInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:is_dynamic-val is deprecated.  Use obstacle_detect-msg:is_dynamic instead.")
  (is_dynamic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleInfo>) ostream)
  "Serializes a message object of type '<ObstacleInfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_dynamic) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleInfo>) istream)
  "Deserializes a message object of type '<ObstacleInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_dynamic) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleInfo>)))
  "Returns string type for a message object of type '<ObstacleInfo>"
  "obstacle_detect/ObstacleInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleInfo)))
  "Returns string type for a message object of type 'ObstacleInfo"
  "obstacle_detect/ObstacleInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleInfo>)))
  "Returns md5sum for a message object of type '<ObstacleInfo>"
  "f7e905afe1b508f817d944c9fa98688a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleInfo)))
  "Returns md5sum for a message object of type 'ObstacleInfo"
  "f7e905afe1b508f817d944c9fa98688a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleInfo>)))
  "Returns full string definition for message of type '<ObstacleInfo>"
  (cl:format cl:nil "float32 distance~%float32 x~%float32 y~%bool is_dynamic~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleInfo)))
  "Returns full string definition for message of type 'ObstacleInfo"
  (cl:format cl:nil "float32 distance~%float32 x~%float32 y~%bool is_dynamic~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleInfo>))
  (cl:+ 0
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleInfo
    (cl:cons ':distance (distance msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':is_dynamic (is_dynamic msg))
))
