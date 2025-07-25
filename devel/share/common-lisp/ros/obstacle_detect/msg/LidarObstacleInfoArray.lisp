; Auto-generated. Do not edit!


(cl:in-package obstacle_detect-msg)


;//! \htmlinclude LidarObstacleInfoArray.msg.html

(cl:defclass <LidarObstacleInfoArray> (roslisp-msg-protocol:ros-message)
  ((obstacle_infos
    :reader obstacle_infos
    :initarg :obstacle_infos
    :type (cl:vector obstacle_detect-msg:LidarObstacleInfo)
   :initform (cl:make-array 0 :element-type 'obstacle_detect-msg:LidarObstacleInfo :initial-element (cl:make-instance 'obstacle_detect-msg:LidarObstacleInfo))))
)

(cl:defclass LidarObstacleInfoArray (<LidarObstacleInfoArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LidarObstacleInfoArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LidarObstacleInfoArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name obstacle_detect-msg:<LidarObstacleInfoArray> is deprecated: use obstacle_detect-msg:LidarObstacleInfoArray instead.")))

(cl:ensure-generic-function 'obstacle_infos-val :lambda-list '(m))
(cl:defmethod obstacle_infos-val ((m <LidarObstacleInfoArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader obstacle_detect-msg:obstacle_infos-val is deprecated.  Use obstacle_detect-msg:obstacle_infos instead.")
  (obstacle_infos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LidarObstacleInfoArray>) ostream)
  "Serializes a message object of type '<LidarObstacleInfoArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacle_infos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacle_infos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LidarObstacleInfoArray>) istream)
  "Deserializes a message object of type '<LidarObstacleInfoArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacle_infos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacle_infos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'obstacle_detect-msg:LidarObstacleInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LidarObstacleInfoArray>)))
  "Returns string type for a message object of type '<LidarObstacleInfoArray>"
  "obstacle_detect/LidarObstacleInfoArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LidarObstacleInfoArray)))
  "Returns string type for a message object of type 'LidarObstacleInfoArray"
  "obstacle_detect/LidarObstacleInfoArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LidarObstacleInfoArray>)))
  "Returns md5sum for a message object of type '<LidarObstacleInfoArray>"
  "55f01341e34384ade81bbed242fb4d66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LidarObstacleInfoArray)))
  "Returns md5sum for a message object of type 'LidarObstacleInfoArray"
  "55f01341e34384ade81bbed242fb4d66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LidarObstacleInfoArray>)))
  "Returns full string definition for message of type '<LidarObstacleInfoArray>"
  (cl:format cl:nil "LidarObstacleInfo[] obstacle_infos~%================================================================================~%MSG: obstacle_detect/LidarObstacleInfo~%float32 obst_x~%float32 obst_y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LidarObstacleInfoArray)))
  "Returns full string definition for message of type 'LidarObstacleInfoArray"
  (cl:format cl:nil "LidarObstacleInfo[] obstacle_infos~%================================================================================~%MSG: obstacle_detect/LidarObstacleInfo~%float32 obst_x~%float32 obst_y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LidarObstacleInfoArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacle_infos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LidarObstacleInfoArray>))
  "Converts a ROS message object to a list"
  (cl:list 'LidarObstacleInfoArray
    (cl:cons ':obstacle_infos (obstacle_infos msg))
))
