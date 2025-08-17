#!/usr/bin/env python3

import rospy
from morai_msgs.msg import ObjectStatusList, ObjectStatus
from geometry_msgs.msg import Point, Vector3

if __name__ == "__main__":
    rospy.init_node("test_publish_delivery_object")
    pub = rospy.Publisher("/delivery_object", ObjectStatusList, queue_size=1, latch=True)
    rospy.sleep(0.5)
    # world 좌표계 기준으로 작성
    # ObjectStatusList 생성
    msg = ObjectStatusList()
    msg.header.frame_id = "world"
    msg.header.stamp = rospy.Time.now()

    # === Pedestrian (unique_id = 50) ===
    # ped = ObjectStatus()
    # ped.unique_id = 50
    # ped.name = "pedestrian"
    # ped.type = 1  # 예시: pedestrian
    # ped.position = Point(-8.302, -4.081, 0.0)
    # ped.velocity = Vector3(0.0, 0.0, 0.0)
    # ped.size = Vector3(0.5, 0.5, 1.7)

    # === Object1 (unique_id = 51) ===
    obj1 = ObjectStatus()
    obj1.unique_id = 51
    obj1.name = "woodbox_1"
    obj1.type = 2  # 예시: obstacle
    obj1.position = Point(-19.0, 4.5, 0.0)
    obj1.velocity = Vector3(0.0, 0.0, 0.0)
    obj1.size = Vector3(1.0, 1.0, 1.0)

    # === Object2 (unique_id = 52) ===
    obj2 = ObjectStatus()
    obj2.unique_id = 52
    obj2.name = "woodbox_2"
    obj2.type = 2
    obj2.position = Point(-3.365, 4.799, 0.0)
    obj2.velocity = Vector3(0.0, 0.0, 0.0)
    obj2.size = Vector3(1.0, 1.0, 1.0)

    # ObjectStatusList에 추가
    msg.num_of_pedestrian = 1
    msg.num_of_obstacle = 2
    # msg.pedestrian_list.append(ped)
    msg.obstacle_list.append(obj1)
    msg.obstacle_list.append(obj2)

    # 발행
    pub.publish(msg)
    rospy.loginfo("Published /delivery_object with 1 pedestrian + 2 objects")
    rospy.spin()



