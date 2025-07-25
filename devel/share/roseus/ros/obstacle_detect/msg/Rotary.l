;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detect::Rotary)
  (if (not (find-package "OBSTACLE_DETECT"))
    (make-package "OBSTACLE_DETECT"))
  (shadow 'Rotary (find-package "OBSTACLE_DETECT")))
(unless (find-package "OBSTACLE_DETECT::ROTARY")
  (make-package "OBSTACLE_DETECT::ROTARY"))

(in-package "ROS")
;;//! \htmlinclude Rotary.msg.html


(defclass obstacle_detect::Rotary
  :super ros::object
  :slots (_dis _orientation ))

(defmethod obstacle_detect::Rotary
  (:init
   (&key
    ((:dis __dis) 0.0)
    ((:orientation __orientation) 0)
    )
   (send-super :init)
   (setq _dis (float __dis))
   (setq _orientation (round __orientation))
   self)
  (:dis
   (&optional __dis)
   (if __dis (setq _dis __dis)) _dis)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:serialization-length
   ()
   (+
    ;; float32 _dis
    4
    ;; uint8 _orientation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _dis
       (sys::poke _dis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _orientation
       (write-byte _orientation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _dis
     (setq _dis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _orientation
     (setq _orientation (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get obstacle_detect::Rotary :md5sum-) "39ade22c37643b134f50ecdaa9e4a0e7")
(setf (get obstacle_detect::Rotary :datatype-) "obstacle_detect/Rotary")
(setf (get obstacle_detect::Rotary :definition-)
      "float32 dis
uint8 orientation
")



(provide :obstacle_detect/Rotary "39ade22c37643b134f50ecdaa9e4a0e7")


