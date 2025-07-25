;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::LidarObstacleInfoArray)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'LidarObstacleInfoArray (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::LIDAROBSTACLEINFOARRAY")
  (make-package "OBSTACLE_DETECT::LIDAROBSTACLEINFOARRAY"))

(in-package "ROS")
;;//! \htmlinclude LidarObstacleInfoArray.msg.html


(defclass obstacle_detect::LidarObstacleInfoArray
  :super ros::object
  :slots (_obstacle_infos ))

(defmethod obstacle_detect::LidarObstacleInfoArray
  (:init
   (&key
    ((:obstacle_infos __obstacle_infos) ())
    )
   (send-super :init)
   (setq _obstacle_infos __obstacle_infos)
   self)
  (:obstacle_infos
   (&rest __obstacle_infos)
   (if (keywordp (car __obstacle_infos))
       (send* _obstacle_infos __obstacle_infos)
     (progn
       (if __obstacle_infos (setq _obstacle_infos (car __obstacle_infos)))
       _obstacle_infos)))
  (:serialization-length
   ()
   (+
    ;; obstacle_detect/LidarObstacleInfo[] _obstacle_infos
    (apply #'+ (send-all _obstacle_infos :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; obstacle_detect/LidarObstacleInfo[] _obstacle_infos
     (write-long (length _obstacle_infos) s)
     (dolist (elem _obstacle_infos)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; obstacle_detect/LidarObstacleInfo[] _obstacle_infos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacle_infos (let (r) (dotimes (i n) (push (instance obstacle_detect::LidarObstacleInfo :init) r)) r))
     (dolist (elem- _obstacle_infos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get obstacle_detect::LidarObstacleInfoArray :md5sum-) "55f01341e34384ade81bbed242fb4d66")
(setf (get obstacle_detect::LidarObstacleInfoArray :datatype-) "obstacle_detect/LidarObstacleInfoArray")
(setf (get obstacle_detect::LidarObstacleInfoArray :definition-)
      "LidarObstacleInfo[] obstacle_infos
================================================================================
MSG: obstacle_detect/LidarObstacleInfo
float32 obst_x
float32 obst_y
")



(provide :obstacle_detect/LidarObstacleInfoArray "55f01341e34384ade81bbed242fb4d66")


