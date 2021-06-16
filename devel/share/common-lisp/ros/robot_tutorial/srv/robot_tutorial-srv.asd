
(cl:in-package :asdf)

(defsystem "robot_tutorial-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ManualCommands" :depends-on ("_package_ManualCommands"))
    (:file "_package_ManualCommands" :depends-on ("_package"))
  ))