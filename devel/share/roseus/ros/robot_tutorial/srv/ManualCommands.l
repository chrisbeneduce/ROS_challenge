;; Auto-generated. Do not edit!


(when (boundp 'robot_tutorial::ManualCommands)
  (if (not (find-package "ROBOT_TUTORIAL"))
    (make-package "ROBOT_TUTORIAL"))
  (shadow 'ManualCommands (find-package "ROBOT_TUTORIAL")))
(unless (find-package "ROBOT_TUTORIAL::MANUALCOMMANDS")
  (make-package "ROBOT_TUTORIAL::MANUALCOMMANDS"))
(unless (find-package "ROBOT_TUTORIAL::MANUALCOMMANDSREQUEST")
  (make-package "ROBOT_TUTORIAL::MANUALCOMMANDSREQUEST"))
(unless (find-package "ROBOT_TUTORIAL::MANUALCOMMANDSRESPONSE")
  (make-package "ROBOT_TUTORIAL::MANUALCOMMANDSRESPONSE"))

(in-package "ROS")





(defclass robot_tutorial::ManualCommandsRequest
  :super ros::object
  :slots (_name _order ))

(defmethod robot_tutorial::ManualCommandsRequest
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

(defclass robot_tutorial::ManualCommandsResponse
  :super ros::object
  :slots (_response ))

(defmethod robot_tutorial::ManualCommandsResponse
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

(defclass robot_tutorial::ManualCommands
  :super ros::object
  :slots ())

(setf (get robot_tutorial::ManualCommands :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get robot_tutorial::ManualCommands :datatype-) "robot_tutorial/ManualCommands")
(setf (get robot_tutorial::ManualCommands :request) robot_tutorial::ManualCommandsRequest)
(setf (get robot_tutorial::ManualCommands :response) robot_tutorial::ManualCommandsResponse)

(defmethod robot_tutorial::ManualCommandsRequest
  (:response () (instance robot_tutorial::ManualCommandsResponse :init)))

(setf (get robot_tutorial::ManualCommandsRequest :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get robot_tutorial::ManualCommandsRequest :datatype-) "robot_tutorial/ManualCommandsRequest")
(setf (get robot_tutorial::ManualCommandsRequest :definition-)
      "string name
string order
---
string response
")

(setf (get robot_tutorial::ManualCommandsResponse :md5sum-) "bd763a4aa4ede563f73c7d9469f42e99")
(setf (get robot_tutorial::ManualCommandsResponse :datatype-) "robot_tutorial/ManualCommandsResponse")
(setf (get robot_tutorial::ManualCommandsResponse :definition-)
      "string name
string order
---
string response
")



(provide :robot_tutorial/ManualCommands "bd763a4aa4ede563f73c7d9469f42e99")


