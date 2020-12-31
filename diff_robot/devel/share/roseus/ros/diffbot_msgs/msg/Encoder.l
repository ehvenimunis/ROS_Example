;; Auto-generated. Do not edit!


(when (boundp 'diffbot_msgs::Encoder)
  (if (not (find-package "DIFFBOT_MSGS"))
    (make-package "DIFFBOT_MSGS"))
  (shadow 'Encoder (find-package "DIFFBOT_MSGS")))
(unless (find-package "DIFFBOT_MSGS::ENCODER")
  (make-package "DIFFBOT_MSGS::ENCODER"))

(in-package "ROS")
;;//! \htmlinclude Encoder.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass diffbot_msgs::Encoder
  :super ros::object
  :slots (_header _encoders ))

(defmethod diffbot_msgs::Encoder
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:encoders __encoders) (make-array 2 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _encoders __encoders)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:encoders
   (&optional __encoders)
   (if __encoders (setq _encoders __encoders)) _encoders)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32[2] _encoders
    (* 4    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32[2] _encoders
     (dotimes (i 2)
       (write-long (elt _encoders i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32[2] _encoders
   (dotimes (i (length _encoders))
     (setf (elt _encoders i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get diffbot_msgs::Encoder :md5sum-) "608278b453add8de9702c9815f58b7b2")
(setf (get diffbot_msgs::Encoder :datatype-) "diffbot_msgs/Encoder")
(setf (get diffbot_msgs::Encoder :definition-)
      "# This is a message to hold number of ticks from Encoders
Header header

# Use an array of size two of type int32 for the two encoders.
# int32 is used instead of int64 because it is not supporte by Arduino/Teensy.
# An overflow is also unlikely with the encoders of the DG01D-E 
# motor with encoder because of its low encoder resolution
int32[2] encoders
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :diffbot_msgs/Encoder "608278b453add8de9702c9815f58b7b2")


