
 # Copyright (C) 2021, Christian Santos Beneduce, EKUMEN's CHALLENGE
 #
 #                    HOLONOMIC ROBOT PY UI MODULE
 #
 #  Simple application to manual enter X,Y,Z values and publish into "directions" then "robot" module will take of them
 #
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #   * Redistributions of source code must retain the above copyright notice,
 #     this list of conditions and the following disclaimer.
 #   * Redistributions in binary form must reproduce the above copyright
 #     notice, this list of conditions and the following disclaimer in the
 #     documentation and/or other materials provided with the distribution.
 #   * Neither the names of Stanford University or Willow Garage, Inc. nor the names of its
 #     contributors may be used to endorse or promote products derived from
 #     this software without specific prior written permission.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 # AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 # ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 # LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 # CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 # SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 # INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 # CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 # ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 # POSSIBILITY OF SUCH DAMAGE.



import os
import rospy
import rospkg
import json


from qt_gui.plugin import Plugin
from python_qt_binding import loadUi
from python_qt_binding.QtWidgets import QWidget

from holonomic_robot.srv import *
from geometry_msgs.msg import Pose2D
from tkFileDialog import askopenfile

# file = '{"points": [{"x":1, "y":10, "theta":0}, {"x":10, "y":1, "theta":0}]}'

class MyPlugin(Plugin):

    def __init__(self, context):
        super(MyPlugin, self).__init__(context)
        # Give QObjects reasonable names
        self.setObjectName('MyPlugin')

        # Process standalone plugin command-line arguments
        from argparse import ArgumentParser
        parser = ArgumentParser()
        # Add argument(s) to the parser.
        parser.add_argument("-q", "--quiet", action="store_true",
                      dest="quiet",
                      help="Put plugin in silent mode")
        args, unknowns = parser.parse_known_args(context.argv())
        if not args.quiet:
            print 'arguments: ', args
            print 'unknowns: ', unknowns

        # Create QWidget
        self._widget = QWidget()
        # Get path to UI file which should be in the "resource" folder of this package
        ui_file = os.path.join(rospkg.RosPack().get_path('rqt_mypkg'), 'resource', 'MyPlugin.ui')
        # Extend the widget with all attributes and children from UI file
        loadUi(ui_file, self._widget)
        # Give QObjects reasonable names
        self._widget.setObjectName('MyPluginUi')
        # asosiates "Test" button with add_json
        add_json = self._widget.Test
        # asosiates "pushButton_2" button with stop
        stop = self._widget.pushButton_2
        # asosiates "pushButton_3" button with resume
        resume = self._widget.pushButton_3
        # asosiates "pushButton_4" button with reset
        reset = self._widget.pushButton_4
        # asosiates buttons with respective callbacks functions
        add_json.clicked.connect(self.addJsonCallback)
        stop.clicked.connect(self.stopCallback)
        resume.clicked.connect(self.resumeCallback)
        reset.clicked.connect(self.resetCallback)
        # Show _widget.windowTitle on left-top of each plugin (when
        # it's set in _widget). This is useful when you open multiple
        # plugins at once. Also if you open multiple instances of your
        # plugin at once, these lines add number to make it easy to
        # tell from pane to pane.
        if context.serial_number() > 1:
            self._widget.setWindowTitle(self._widget.windowTitle() + (' (%d)' % context.serial_number()))
        # Add widget to the user interface
        context.add_widget(self._widget)

#Callback function for JSON FILE button
    def addJsonCallback(self, msg):
        position = Pose2D()
        file = askopenfile()
        if file:
            data = json.load(file)
            #load json file and send it to "directions" topic
            dirs_pub = rospy.Publisher('directions', Pose2D, queue_size=1000)
            rate = rospy.Rate(10) # 1hz
            size = len(data["points"])
            count = 0
            while not rospy.is_shutdown():
                position.x = data["points"][count]["x"]
                position.y = data["points"][count]["y"]
                position.theta = data["points"][count]["theta"]
                print "sent: ", position.x, position.y
                dirs_pub.publish(position)
                count = count + 1
                if count >= size:
                    break
                rate.sleep()

#Callback function for STOP button
    def stopCallback(self, msg):
        print "**sending Stop to svc**"
        #send "stop" order to robot service
        self.manual_commands_client("turtle1", "stop")

#Callback function for RESUME button
    def resumeCallback(self, msg):
        print "**sending Resume to svc**"
        #send "resume" order to robot service
        self.manual_commands_client("turtle1", "resume")

#Callback function for RESET button
    def resetCallback(self, msg):
        print "**sending Reset to svc**"
        #send "reset" order to robot service
        self.manual_commands_client("turtle1", "reset")

#main function to connect to the robot service
    def manual_commands_client(self, name, order):
        rospy.wait_for_service('manual_commands')
        try:
            manual_commands = rospy.ServiceProxy('manual_commands', ManualCommands)
            resp1 = manual_commands(name, order)
            return
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e

    def shutdown_plugin(self):
        # TODO unregister all publishers here
        pass

    def save_settings(self, plugin_settings, instance_settings):
        # TODO save intrinsic configuration, usually using:
        # instance_settings.set_value(k, v)
        pass

    def restore_settings(self, plugin_settings, instance_settings):
        # TODO restore intrinsic configuration, usually using:
        # v = instance_settings.value(k)
        pass

    #def trigger_configuration(self):
        # Comment in to signal that the plugin has a way to configure
        # This will enable a setting button (gear icon) in each dock widget title bar
        # Usually used to open a modal configuration dialog
