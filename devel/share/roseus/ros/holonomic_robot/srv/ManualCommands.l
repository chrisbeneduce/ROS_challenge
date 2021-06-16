;; Auto-generated. Do not edit!


(when (boundp 'holonomic_robot::ManualCommands)
  (if (not (find-package "HOLONOMIC_ROBOT"))
    (make-package "HOLONOMIC_ROBOT"))
  (shadow 'ManualCommands (find-package "HOLONOMIC_ROBOT")))
(unless (find-package "HOLONOMIC_ROBOT::MANUALCOMMANDS")
  (make-package "HOLONOMIC_ROBOT::MANUALCOMMANDS"))
(unless (find-package "HOLONOMIC_ROBOT::MANUALCOMMANDSREQUEST")
  (make-package "HOLONOMIC_ROBOT::MANUALCOMMANDSREQUEST"))
(unless (find-package "HOLONOMIC_ROBOT::MANUALCOMMANDSRESPONSE")
  (make-package "HOLONOMIC_ROBOT::MANUALCOMMANDSRESPONSE"))

(in-package "ROS")





(defclass holonomic_robot::ManualCommandsRequest
  :super ros::object
  :slots (_name _order ))

(defmethod holonomic_robot::ManualCommandsRequest
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

(defclass holonomic_robot::ManualCommandsResponse
  :super ros::object
  :slots (_response ))

(defmethod holonomic_robot::ManualCommandsResponse
  (:init
   (&key
    ((:response __response) "")
    )
   (send-super :init)
   (setq _response (string __response))
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass holonomic_robot::ManualCommands
  :super ros::object
  :slots ())

(setf (get holonomic_robot::ManualCommands :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get holonomic_robot::ManualCommands :datatype-) "holonomic_robot/ManualCommands")
(setf (get holonomic_robot::ManualCommands :request) holonomic_robot::ManualCommandsRequest)
(setf (get holonomic_robot::ManualCommands :response) holonomic_robot::ManualCommandsResponse)

(defmethod holonomic_robot::ManualCommandsRequest
  (:response () (instance holonomic_robot::ManualCommandsResponse :init)))

(setf (get holonomic_robot::ManualCommandsRequest :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get holonomic_robot::ManualCommandsRequest :datatype-) "holonomic_robot/ManualCommandsRequest")
(setf (get holonomic_robot::ManualCommandsRequest :definition-)
      "string name
string order
---
string response
")

(setf (get holonomic_robot::ManualCommandsResponse :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get holonomic_robot::ManualCommandsResponse :datatype-) "holonomic_robot/ManualCommandsResponse")
(setf (get holonomic_robot::ManualCommandsResponse :definition-)
      "string name
string order
---
string response
")



(provide :holonomic_robot/ManualCommands "bd763a4aa4ede563f73c7d9469f42e99")


