;; Auto-generated. Do not edit!


(when (boundp 'holonomic_robot::Orders)
  (if (not (find-package "HOLONOMIC_ROBOT"))
    (make-package "HOLONOMIC_ROBOT"))
  (shadow 'Orders (find-package "HOLONOMIC_ROBOT")))
(unless (find-package "HOLONOMIC_ROBOT::ORDERS")
  (make-package "HOLONOMIC_ROBOT::ORDERS"))

(in-package "ROS")
;;//! \htmlinclude Orders.msg.html


(defclass holonomic_robot::Orders
  :super ros::object
  :slots (_name _order ))

(defmethod holonomic_robot::Orders
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

(setf (get holonomic_robot::Orders :md5sum-) "68d737f79d05f32ec5b9d05672f53626")
(setf (get holonomic_robot::Orders :datatype-) "holonomic_robot/Orders")
(setf (get holonomic_robot::Orders :definition-)
      "string name
string order
")



(provide :holonomic_robot/Orders "68d737f79d05f32ec5b9d05672f53626")


