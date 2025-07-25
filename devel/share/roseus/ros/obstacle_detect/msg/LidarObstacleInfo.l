;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::LidarObstacleInfo)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'LidarObstacleInfo (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::LIDAROBSTACLEINFO")
  (make-package "OBSTACLE_DETECT::LIDAROBSTACLEINFO"))

(in-package "ROS")
;;//! \htmlinclude LidarObstacleInfo.msg.html


(defclass obstacle_detect::LidarObstacleInfo
  :super ros::object
  :slots (_obst_x _obst_y ))

(defmethod obstacle_detect::LidarObstacleInfo
  (:init
   (&key
    ((:obst_x __obst_x) 0.0)
    ((:obst_y __obst_y) 0.0)
    )
   (send-super :init)
   (setq _obst_x (float __obst_x))
   (setq _obst_y (float __obst_y))
   self)
  (:obst_x
   (&optional __obst_x)
   (if __obst_x (setq _obst_x __obst_x)) _obst_x)
  (:obst_y
   (&optional __obst_y)
   (if __obst_y (setq _obst_y __obst_y)) _obst_y)
  (:serialization-length
   ()
   (+
    ;; float32 _obst_x
    4
    ;; float32 _obst_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _obst_x
       (sys::poke _obst_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _obst_y
       (sys::poke _obst_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _obst_x
     (setq _obst_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _obst_y
     (setq _obst_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get obstacle_detect::LidarObstacleInfo :md5sum-) "29acf9247b80e40f99626c6dd6c9f858")
(setf (get obstacle_detect::LidarObstacleInfo :datatype-) "obstacle_detect/LidarObstacleInfo")
(setf (get obstacle_detect::LidarObstacleInfo :definition-)
      "float32 obst_x
float32 obst_y
")



(provide :obstacle_detect/LidarObstacleInfo "29acf9247b80e40f99626c6dd6c9f858")


