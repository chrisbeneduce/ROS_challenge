; Auto-generated. Do not edit!


(cl:in-package holonomic_robot-msg)


;//! \htmlinclude Orders.msg.html

(cl:defclass <Orders> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Orders (<Orders>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Orders>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Orders)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name holonomic_robot-msg:<Orders> is deprecated: use holonomic_robot-msg:Orders instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Orders>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader holonomic_robot-msg:name-val is deprecated.  Use holonomic_robot-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <Orders>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader holonomic_robot-msg:order-val is deprecated.  Use holonomic_robot-msg:order instead.")
  (order m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Orders>) ostream)
  "Serializes a message object of type '<Orders>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Orders>) istream)
  "Deserializes a message object of type '<Orders>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Orders>)))
  "Returns string type for a message object of type '<Orders>"
  "holonomic_robot/Orders")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Orders)))
  "Returns string type for a message object of type 'Orders"
  "holonomic_robot/Orders")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Orders>)))
  "Returns md5sum for a message object of type '<Orders>"
  "68d737f79d05f32ec5b9d05672f53626")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Orders)))
  "Returns md5sum for a message object of type 'Orders"
  "68d737f79d05f32ec5b9d05672f53626")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Orders>)))
  "Returns full string definition for message of type '<Orders>"
  (cl:format cl:nil "string name~%string order~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Orders)))
  "Returns full string definition for message of type 'Orders"
  (cl:format cl:nil "string name~%string order~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Orders>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'order))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Orders>))
  "Converts a ROS message object to a list"
  (cl:list 'Orders
    (cl:cons ':name (name msg))
    (cl:cons ':order (order msg))
))
