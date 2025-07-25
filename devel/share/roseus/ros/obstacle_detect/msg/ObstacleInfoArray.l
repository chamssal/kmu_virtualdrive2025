;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::ObstacleInfoArray)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'ObstacleInfoArray (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::OBSTACLEINFOARRAY")
  (make-package "OBSTACLE_DETECT::OBSTACLEINFOARRAY"))

(in-package "ROS")
;;//! \htmlinclude ObstacleInfoArray.msg.html


(defclass obstacle_detect::ObstacleInfoArray
  :super ros::object
  :slots (_obstacles ))

(defmethod obstacle_detect::ObstacleInfoArray
  (:init
   (&key
    ((:obstacles __obstacles) ())
    )
   (send-super :init)
   (setq _obstacles __obstacles)
   self)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; obstacle_detect/ObstacleInfo[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; obstacle_detect/ObstacleInfo[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; obstacle_detect/ObstacleInfo[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance obstacle_detect::ObstacleInfo :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get obstacle_detect::ObstacleInfoArray :md5sum-) "d08c5873969de4a06260eb9004c511f8")
(setf (get obstacle_detect::ObstacleInfoArray :datatype-) "obstacle_detect/ObstacleInfoArray")
(setf (get obstacle_detect::ObstacleInfoArray :definition-)
      "ObstacleInfo[] obstacles
================================================================================
MSG: obstacle_detect/ObstacleInfo
float32 distance
float32 x
float32 y
bool is_dynamic
")



(provide :obstacle_detect/ObstacleInfoArray "d08c5873969de4a06260eb9004c511f8")


