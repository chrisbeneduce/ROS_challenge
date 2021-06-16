
(cl:in-package :asdf)

(defsystem "holonomic_robot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Orders" :depends-on ("_package_Orders"))
    (:file "_package_Orders" :depends-on ("_package"))
  ))