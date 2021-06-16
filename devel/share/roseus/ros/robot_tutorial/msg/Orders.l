;; Auto-generated. Do not edit!


(when (boundp 'robot_tutorial::Orders)
  (if (not (find-package "ROBOT_TUTORIAL"))
    (make-package "ROBOT_TUTORIAL"))
  (shadow 'Orders (find-package "ROBOT_TUTORIAL")))
(unless (find-package "ROBOT_TUTORIAL::ORDERS")
  (make-package "ROBOT_TUTORIAL::ORDERS"))

(in-package "ROS")
;;//! \htmlinclude Orders.msg.html


(defclass robot_tutorial::Orders
  :super ros::object
  :slots (_name _order ))

(defmethod robot_tutorial::Orders
  (:init
   (&key
    ((:name __name) "")
    ((:order __order) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _order (string __order))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _order
    4 (length _order)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _order
       (write-long (length _order) s) (princ _order s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _order
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _order (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_tutorial::Orders :md5sum-) "68d737f79d05f32ec5b9d05672f53626")
(setf (get robot_tutorial::Orders :datatype-) "robot_tutorial/Orders")
(setf (get robot_tutorial::Orders :definition-)
      "string name
string order
")



(provide :robot_tutorial/Orders "68d737f79d05f32ec5b9d05672f53626")


