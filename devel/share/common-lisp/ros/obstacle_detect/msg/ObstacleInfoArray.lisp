; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude ObstacleInfoArray.msg.html

(cl:defclass <ObstacleInfoArray> (roslisp-msg-protocol:ros-message)
  ((obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector obstacle_detect-msg:ObstacleInfo)
   :initform (cl:make-array 0 :element-type 'obstacle_detect-msg:ObstacleInfo :initial-element (cl:make-instance 'obstacle_detect-msg:ObstacleInfo))))
)

(cl:defclass ObstacleInfoArray (<ObstacleInfoArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleInfoArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleInfoArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<ObstacleInfoArray> is deprecated: use obstacle_detect-msg:ObstacleInfoArray instead.")))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <ObstacleInfoArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:obstacles-val is deprecated.  Use obstacle_detect-msg:obstacles instead.")
  (obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleInfoArray>) ostream)
  "Serializes a message object of type '<ObstacleInfoArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleInfoArray>) istream)
  "Deserializes a message object of type '<ObstacleInfoArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'obstacle_detect-msg:ObstacleInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleInfoArray>)))
  "Returns string type for a message object of type '<ObstacleInfoArray>"
  "obstacle_detect/ObstacleInfoArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleInfoArray)))
  "Returns string type for a message object of type 'ObstacleInfoArray"
  "obstacle_detect/ObstacleInfoArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleInfoArray>)))
  "Returns md5sum for a message object of type '<ObstacleInfoArray>"
  "d08c5873969de4a06260eb9004c511f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleInfoArray)))
  "Returns md5sum for a message object of type 'ObstacleInfoArray"
  "d08c5873969de4a06260eb9004c511f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleInfoArray>)))
  "Returns full string definition for message of type '<ObstacleInfoArray>"
  (cl:format cl:nil "ObstacleInfo[] obstacles~%================================================================================~%MSG: obstacle_detect/ObstacleInfo~%float32 distance~%float32 x~%float32 y~%bool is_dynamic~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleInfoArray)))
  "Returns full string definition for message of type 'ObstacleInfoArray"
  (cl:format cl:nil "ObstacleInfo[] obstacles~%================================================================================~%MSG: obstacle_detect/ObstacleInfo~%float32 distance~%float32 x~%float32 y~%bool is_dynamic~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleInfoArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleInfoArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleInfoArray
    (cl:cons ':obstacles (obstacles msg))
))
