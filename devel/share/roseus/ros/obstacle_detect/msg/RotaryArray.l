;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::RotaryArray)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'RotaryArray (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::ROTARYARRAY")
  (make-package "OBSTACLE_DETECT::ROTARYARRAY"))

(in-package "ROS")
;;//! \htmlinclude RotaryArray.msg.html


(defclass obstacle_detect::RotaryArray
  :super ros::object
  :slots (_moving_cars ))

(defmethod obstacle_detect::RotaryArray
  (:init
   (&key
    ((:moving_cars __moving_cars) ())
    )
   (send-super :init)
   (setq _moving_cars __moving_cars)
   self)
  (:moving_cars
   (&rest __moving_cars)
   (if (keywordp (car __moving_cars))
       (send* _moving_cars __moving_cars)
     (progn
       (if __moving_cars (setq _moving_cars (car __moving_cars)))
       _moving_cars)))
  (:serialization-length
   ()
   (+
    ;; obstacle_detect/Rotary[] _moving_cars
    (apply #'+ (send-all _moving_cars :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; obstacle_detect/Rotary[] _moving_cars
     (write-long (length _moving_cars) s)
     (dolist (elem _moving_cars)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; obstacle_detect/Rotary[] _moving_cars
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _moving_cars (let (r) (dotimes (i n) (push (instance obstacle_detect::Rotary :init) r)) r))
     (dolist (elem- _moving_cars)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get obstacle_detect::RotaryArray :md5sum-) "7f4d8ffc9ddc00a08e234a44d62c525f")
(setf (get obstacle_detect::RotaryArray :datatype-) "obstacle_detect/RotaryArray")
(setf (get obstacle_detect::RotaryArray :definition-)
      "Rotary[] moving_cars

================================================================================
MSG: obstacle_detect/Rotary
float32 dis
uint8 orientation
")



(provide :obstacle_detect/RotaryArray "7f4d8ffc9ddc00a08e234a44d62c525f")


