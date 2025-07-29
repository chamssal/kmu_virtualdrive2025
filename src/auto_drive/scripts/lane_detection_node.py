#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
import math
from sensor_msgs.msg import CompressedImage
from std_msgs.msg import Float32
from cv_bridge import CvBridge

def resize_and_pad(img, new_shape=(640, 640), color=114):
    shape = img.shape[:2]
    r = min(new_shape[0] / shape[0], new_shape[1] / shape[1])
    new_unpad = (int(round(shape[1] * r)), int(round(shape[0] * r)))
    dw, dh = new_shape[1] - new_unpad[0], new_shape[0] - new_unpad[1]
    dw //= 2; dh //= 2
    img = cv2.resize(img, new_unpad, interpolation=cv2.INTER_AREA)
    canvas = np.full((new_shape[0], new_shape[1], 3), color, dtype=np.uint8)
    canvas[dh:dh + new_unpad[1], dw:dw + new_unpad[0]] = img
    return canvas, r, dw, dh, new_unpad

def compute_steering(offset, focal_length=1.0):
    return math.degrees(math.atan2(offset, focal_length * 640))

def annotate_image(img_bgr, lane_mask, steer_angle, offset_px):
    h, w = img_bgr.shape[:2]
    ys, xs = np.where(lane_mask > 0)
    if len(xs) == 0:
        return img_bgr
    lane_x = int(xs.mean())
    mid_x = w // 2
    overlay = img_bgr.copy()
    overlay[lane_mask > 0] = (255, 0, 255)
    result = cv2.addWeighted(img_bgr, 0.7, overlay, 0.3, 0)
    cv2.line(result, (mid_x, 0), (mid_x, h), (0, 255, 255), 2)
    cv2.line(result, (lane_x, 0), (lane_x, h), (0, 0, 255), 2)
    arrow_tip  = (mid_x, int(h * 0.7))
    arrow_base = (lane_x, int(h * 0.7))
    cv2.arrowedLine(result, arrow_tip, arrow_base, (0, 255, 0), 4, tipLength=0.2)
    cv2.putText(result, f"Steering Angle: {steer_angle:.2f} deg", (10, 30),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    cv2.putText(result, f"Offset: {offset_px:.1f} px", (10, 70),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    return result

class LaneDetectionNode:
    def __init__(self):
        rospy.init_node('lane_detection_node', anonymous=True)
        self.bridge = CvBridge()

        # 모델 로드
        model_path = rospy.get_param("~model_path", 
            "/home/lsc/Downloads/kmu_virtualdrive2025/src/auto_drive/models/yolop-640-640.onnx")
        self.net = cv2.dnn.readNet(model_path)

        # Subscriber / Publisher
        rospy.Subscriber("/camera/image_raw/compressed", CompressedImage, self.image_callback, queue_size=1)
        self.pub_image = rospy.Publisher("/lane_detection_result", CompressedImage, queue_size=1)
        self.pub_angle = rospy.Publisher("/steering_angle", Float32, queue_size=1)

        rospy.loginfo("LaneDetectionNode started.")

    def image_callback(self, msg):
        np_arr = np.frombuffer(msg.data, np.uint8)
        img_bgr = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        if img_bgr is None:
            rospy.logwarn("Failed to decode image")
            return

        h, w = img_bgr.shape[:2]
        img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)
        canvas, r, dw, dh, (unpad_w, unpad_h) = resize_and_pad(img_rgb, (640, 640))
        blob = canvas.astype(np.float32) / 255.0
        mean = np.array([0.485, 0.456, 0.406], dtype=np.float32)
        std  = np.array([0.229, 0.224, 0.225], dtype=np.float32)
        blob = (blob - mean) / std
        blob = blob.transpose(2, 0, 1)[None, ...]

        self.net.setInput(blob)
        try:
            det_out, da_seg, ll_seg = self.net.forward(['det_out', 'drive_area_seg', 'lane_line_seg'])
        except cv2.error as e:
            rospy.logerr(f"ONNX inference failed: {e}")
            return

        ll_seg = ll_seg[0, 1, :, :]
        ll_mask = (ll_seg > 0.5).astype(np.uint8) * 255
        ll_mask = ll_mask[dh:dh+unpad_h, dw:dw+unpad_w]
        ll_mask = cv2.resize(ll_mask, (w, h), interpolation=cv2.INTER_LINEAR)

        xs = np.where(ll_mask > 0)[1]
        offset_px = xs.mean() - (w / 2) if len(xs) > 0 else 0
        steer_angle = compute_steering(offset_px)

        vis = annotate_image(img_bgr, ll_mask, steer_angle, offset_px)
        out_msg = CompressedImage()
        out_msg.header.stamp = rospy.Time.now()
        out_msg.format = "jpeg"
        out_msg.data = cv2.imencode('.jpg', vis)[1].tobytes()

        self.pub_image.publish(out_msg)
        self.pub_angle.publish(Float32(steer_angle))

if __name__ == '__main__':
    try:
        node = LaneDetectionNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
