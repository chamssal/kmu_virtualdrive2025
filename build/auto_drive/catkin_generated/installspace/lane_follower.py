#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
import torch
from sensor_msgs.msg import CompressedImage
from std_msgs.msg import Float64
from cv_bridge import CvBridge
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point

class LaneFollower:
    def __init__(self):
        rospy.init_node('lane_follower')
        self.bridge = CvBridge()

        # 모델 로딩
        model_path = rospy.get_param("~model_path", "/models/best_model.pth")
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu") 
        self.model = torch.jit.load(model_path).to(self.device).eval()

        self.sub = rospy.Subscriber('/image_jpeg/compressed', CompressedImage, self.image_callback, queue_size=1)
        self.pub = rospy.Publisher('/lane_follower/steer', Float64, queue_size=1)
        self.marker_pub = rospy.Publisher('/lane_follower/marker', Marker, queue_size=1) # 시각화용 publisher


        # 해상도 설정
        self.model_w, self.model_h = 512, 256 # 레인넷모델이 512x256 사이즈로 학습되어있음
        self.img_w, self.img_h = 640, 480 # 우리가 받아오는 compressedImage는 640x480 사이즈임
        self.center_x = self.img_w // 2

        # BEV 변환 파라미터 (튜닝 필요)
        self.src = np.float32([[200, 300], [440, 300], [0, 480], [640, 480]])
        self.dst = np.float32([[160, 0], [480, 0], [160, 480], [480, 480]])

    def image_callback(self, msg):
        img = self.bridge.compressed_imgmsg_to_cv2(msg, "bgr8") # compressed img 메시지를 cv2용으로 변경
        img_resized = cv2.resize(img, (self.model_w, self.model_h)) # 모델에 맞는 사이즈로 resize

        with torch.no_grad(): # 추론할때는 no_grad()모드로 메모리/속도 최적화
            input_tensor = self.preprocess(img_resized) # 전처리과정
            pred = self.model(input_tensor)[0] # 레인넷 모델 추론 -> binary mask (차선인 픽셀 = 1)
            mask = (pred > 0.5).cpu().numpy().astype(np.uint8)[0] * 255

        mask_up = cv2.resize(mask, (self.img_w, self.img_h)) # 마스크를 원본카메라 해상도로 리사이즈
        bev_img = self.bev_transform(mask_up) # BEV 변환
        steer = self.compute_steering(bev_img) # BEV 이미지로 중심선 검출 이후 조향각 계산
        self.pub.publish(Float64(steer)) # 계산한 조향각을 publish

    def preprocess(self, img): # 전처리 함수
        img_tensor = torch.from_numpy(img).permute(2, 0, 1).float() / 255.0
        return img_tensor.unsqueeze(0).to(self.device)

    def bev_transform(self, mask): # BEV 변환 함수
        M = cv2.getPerspectiveTransform(self.src, self.dst)
        return cv2.warpPerspective(mask, M, (self.img_w, self.img_h))

    def compute_steering(self, bev): # 중심선 검출 및 조향각 계산 함수
        roi = bev[int(self.img_h * 0.6):, :]
        M = cv2.moments(roi)
        cx = int(M['m10'] / M['m00']) if M['m00'] else self.center_x

        self.publish_marker(cx)

        error = cx - self.center_x
        steer = -error / 100.0
        return np.clip(steer, -1.0, 1.0)
    
    def publish_marker(self, cx_image):
        # 차량 기준 (base_link)에서의 중심점 위치 계산
        #  → BEV는 이미 차선이 수직이니까, y축은 거리, x축은 오프셋이라 보면 됨
        #  → y는 1.5m 앞으로, x는 중심 오차를 픽셀→미터로 단순히 스케일 변환
        x_error_pixel = cx_image - self.center_x
        x_offset_m = x_error_pixel * 0.01  # 예: 100px = 1m
        y_forward_m = 1.5  # 시야 기준 1.5m 앞의 점으로 고정

        marker = Marker()
        marker.header.frame_id = "base_link"
        marker.header.stamp = rospy.Time.now()
        marker.ns = "lane_center"
        marker.id = 0
        marker.type = Marker.SPHERE
        marker.action = Marker.ADD
        marker.pose.position.x = x_offset_m
        marker.pose.position.y = 0
        marker.pose.position.z = 0.1
        marker.scale.x = 0.2
        marker.scale.y = 0.2
        marker.scale.z = 0.2
        marker.color.r = 1.0
        marker.color.g = 0.0
        marker.color.b = 0.0
        marker.color.a = 1.0
        marker.lifetime = rospy.Duration(0.1)
        self.marker_pub.publish(marker)

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    node = LaneFollower()
    node.run()
