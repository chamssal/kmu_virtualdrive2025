;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::ObstacleInfo)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'ObstacleInfo (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::OBSTACLEINFO")
  (make-package "OBSTACLE_DETECT::OBSTACLEINFO"))

(in-package "ROS")
;;//! \htmlinclude ObstacleInfo.msg.html


(defclass obstacle_detect::ObstacleInfo
  :super ros::object
  :slots (_distance _x _y _is_dynamic ))

(defmethod obstacle_detect::ObstacleInfo
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:is_dynamic __is_dynamic) nil)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _is_dynamic __is_dynamic)
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:is_dynamic
   (&optional (__is_dynamic :null))
   (if (not (eq __is_dynamic :null)) (setq _is_dynamic __is_dynamic)) _is_dynamic)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; bool _is_dynamic
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _is_dynamic
       (if _is_dynamic (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _is_dynamic
     (setq _is_dynamic (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get obstacle_detect::ObstacleInfo :md5sum-) "f7e905afe1b508f817d944c9fa98688a")
(setf (get obstacle_detect::ObstacleInfo :datatype-) "obstacle_detect/ObstacleInfo")
(setf (get obstacle_detect::ObstacleInfo :definition-)
      "float32 distance
float32 x
float32 y
bool is_dynamic
")



(provide :obstacle_detect/ObstacleInfo "f7e905afe1b508f817d944c9fa98688a")


