
(cl:in-package :asdf)

(defsystem "obstacle_detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LidarObstacleInfo" :depends-on ("_package_LidarObstacleInfo"))
    (:file "_package_LidarObstacleInfo" :depends-on ("_package"))
    (:file "LidarObstacleInfoArray" :depends-on ("_package_LidarObstacleInfoArray"))
    (:file "_package_LidarObstacleInfoArray" :depends-on ("_package"))
    (:file "ObstacleInfo" :depends-on ("_package_ObstacleInfo"))
    (:file "_package_ObstacleInfo" :depends-on ("_package"))
    (:file "ObstacleInfoArray" :depends-on ("_package_ObstacleInfoArray"))
    (:file "_package_ObstacleInfoArray" :depends-on ("_package"))
    (:file "Rotary" :depends-on ("_package_Rotary"))
    (:file "_package_Rotary" :depends-on ("_package"))
    (:file "RotaryArray" :depends-on ("_package_RotaryArray"))
    (:file "_package_RotaryArray" :depends-on ("_package"))
  ))