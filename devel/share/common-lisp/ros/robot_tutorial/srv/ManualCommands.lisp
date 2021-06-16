; Auto-generated. Do not edit!


(cl:in-package robot_tutorial-srv)


;//! \htmlinclude ManualCommands-request.msg.html

(cl:defclass <ManualCommands-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (order
    :reader order
    :initarg :order
    :type cl:string
    :initform ""))
)

(cl:defclass ManualCommands-request (<ManualCommands-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ManualCommands-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ManualCommands-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_tutorial-srv:<ManualCommands-request> is deprecated: use robot_tutorial-srv:ManualCommands-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ManualCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_tutorial-srv:name-val is deprecated.  Use robot_tutorial-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <ManualCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_tutorial-srv:order-val is deprecated.  Use robot_tutorial-srv:order instead.")
  (order m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ManualCommands-request>) ostream)
  "Serializes a message object of type '<ManualCommands-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'order))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'order))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ManualCommands-request>) istream)
  "Deserializes a message object of type '<ManualCommands-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'order) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'order) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ManualCommands-request>)))
  "Returns string type for a service object of type '<ManualCommands-request>"
  "robot_tutorial/ManualCommandsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualCommands-request)))
  "Returns string type for a service object of type 'ManualCommands-request"
  "robot_tutorial/ManualCommandsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ManualCommands-request>)))
  "Returns md5sum for a message object of type '<ManualCommands-request>"
  "bd763a4aa4ede563f73c7d9469f42e99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ManualCommands-request)))
  "Returns md5sum for a message object of type 'ManualCommands-request"
  "bd763a4aa4ede563f73c7d9469f42e99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ManualCommands-request>)))
  "Returns full string definition for message of type '<ManualCommands-request>"
  (cl:format cl:nil "string name~%string order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ManualCommands-request)))
  "Returns full string definition for message of type 'ManualCommands-request"
  (cl:format cl:nil "string name~%string order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ManualCommands-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'order))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ManualCommands-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ManualCommands-request
    (cl:cons ':name (name msg))
    (cl:cons ':order (order msg))
))
;//! \htmlinclude ManualCommands-response.msg.html

(cl:defclass <ManualCommands-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass ManualCommands-response (<ManualCommands-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ManualCommands-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ManualCommands-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_tutorial-srv:<ManualCommands-response> is deprecated: use robot_tutorial-srv:ManualCommands-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <ManualCommands-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_tutorial-srv:response-val is deprecated.  Use robot_tutorial-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ManualCommands-response>) ostream)
  "Serializes a message object of type '<ManualCommands-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ManualCommands-response>) istream)
  "Deserializes a message object of type '<ManualCommands-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ManualCommands-response>)))
  "Returns string type for a service object of type '<ManualCommands-response>"
  "robot_tutorial/ManualCommandsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualCommands-response)))
  "Returns string type for a service object of type 'ManualCommands-response"
  "robot_tutorial/ManualCommandsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ManualCommands-response>)))
  "Returns md5sum for a message object of type '<ManualCommands-response>"
  "bd763a4aa4ede563f73c7d9469f42e99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ManualCommands-response)))
  "Returns md5sum for a message object of type 'ManualCommands-response"
  "bd763a4aa4ede563f73c7d9469f42e99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ManualCommands-response>)))
  "Returns full string definition for message of type '<ManualCommands-response>"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ManualCommands-response)))
  "Returns full string definition for message of type 'ManualCommands-response"
  (cl:format cl:nil "string response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ManualCommands-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ManualCommands-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ManualCommands-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ManualCommands)))
  'ManualCommands-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ManualCommands)))
  'ManualCommands-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualCommands)))
  "Returns string type for a service object of type '<ManualCommands>"
  "robot_tutorial/ManualCommands")