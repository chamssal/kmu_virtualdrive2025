; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude Rotary.msg.html

(cl:defclass <Rotary> (roslisp-msg-protocol:ros-message)
  ((dis
    :reader dis
    :initarg :dis
    :type cl:float
    :initform 0.0)
   (orientation
    :reader orientation
    :initarg :orientation
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Rotary (<Rotary>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rotary>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rotary)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<Rotary> is deprecated: use obstacle_detect-msg:Rotary instead.")))

(cl:ensure-generic-function 'dis-val :lambda-list '(m))
(cl:defmethod dis-val ((m <Rotary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:dis-val is deprecated.  Use obstacle_detect-msg:dis instead.")
  (dis m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <Rotary>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:orientation-val is deprecated.  Use obstacle_detect-msg:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rotary>) ostream)
  "Serializes a message object of type '<Rotary>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orientation)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rotary>) istream)
  "Deserializes a message object of type '<Rotary>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orientation)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rotary>)))
  "Returns string type for a message object of type '<Rotary>"
  "obstacle_detect/Rotary")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rotary)))
  "Returns string type for a message object of type 'Rotary"
  "obstacle_detect/Rotary")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rotary>)))
  "Returns md5sum for a message object of type '<Rotary>"
  "39ade22c37643b134f50ecdaa9e4a0e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rotary)))
  "Returns md5sum for a message object of type 'Rotary"
  "39ade22c37643b134f50ecdaa9e4a0e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rotary>)))
  "Returns full string definition for message of type '<Rotary>"
  (cl:format cl:nil "float32 dis~%uint8 orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rotary)))
  "Returns full string definition for message of type 'Rotary"
  (cl:format cl:nil "float32 dis~%uint8 orientation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rotary>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rotary>))
  "Converts a ROS message object to a list"
  (cl:list 'Rotary
    (cl:cons ':dis (dis msg))
    (cl:cons ':orientation (orientation msg))
))
