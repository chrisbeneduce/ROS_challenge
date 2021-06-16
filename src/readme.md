
[![N|Solid](https://www.ekumenlabs.com/images/logo.png)](https://www.ekumenlabs.com/)
# Technical documentation

# 1-Technical briefing about "robot.cpp" 📋

### About the Nodes / Topics
In the following image, it is possible to see the main topics and nodes of the solution running under node **/master** (ROS) and the **core** (**roscore**). Also the aditional modules are included in order to show the interactions with them.


[![N|Solid](https://live.staticflickr.com/65535/51073608836_f75c81da42.jpg)](https://flic.kr/p/2kPcAwG)
- The main node **/robot** advertise on **/master** whom returns **vel_pub** to be able to publish the linear and angular velocity to turtle's **/cmd_vel** using a **twist message**<span id="a1">[¹](#1)</span> 

- Then it subscribes to the topic **/directions** using **messages_sub** in order to obtain from him coordinates from the **PY UI** or the testing node **/dirs**, using the callback function **dirCallback**, this function will be pushing the coordinates (expressed in a **Pose2d message**<span id="a2">[²](#2)</span>) into a queue.
 
- **pose_sub** is a subscription to turtle's topic **/pose** in order to obtain from him the current coordinates of the turtle using the callback function **poseCallback**, this function updates the current coordinates (expressed in a **turtlesim/Pose**<span id="a4">[⁴](#4)</span>) send it to the **/feedback** node and to the "core" **toGoal** function.

 - **feedback_pub** is used by **posCallback** function to publish to current coordinates into the topic **/feedback** .

- **service** is a the published service of the node **/robot**, which have the entry point **manual_commands**, each time the entry point is called the function **process** takes cares of the command (stop/resume/reset) an calls the entry point of turtle's service **teleportabsolute** using **client** in order to update the current coordinates depending the value of **order**.

- **toGoal** is a key method becuase in order for this to work, we’ll need to turn the [x, y] cartesian coordinate to its polar form. We can’t send the distance (in the graphic bellow **r**) to turtles’s topic **/cmd_vel**, you have to send a velocity, linear and angular velocities using a **twist message**<span id="a1">[1](#1)</span>).
In order to get to a certain point, we must set the velocity to a value proportional to the distance between our current position and the goal.
This is that I choose to have implemented, a [proportional controller](https://en.wikipedia.org/wiki/PID_controller), setting the velocity proportional to a constant Kv and the distance to go. (The values of Kv and Kh were somewhat random in this sample). 

[![N|Solid](https://live.staticflickr.com/65535/51067910908_6f61beeaf3.jpg)](https://flic.kr/p/2kNGoJy)


- Finally the principal C++ thread **main** do the rest, it checks the queue, it is not empty (data from **/directions**) pop them, calls to main positioning using function (uses **order** received from **manual_commands** | queued coordinates managed by **/directions** or **posecallback** it makes all the math and trigo calculations calling **toGoal** and set **/cmd_vel** then enter enter in a loop, pumping callbacks.  
 
    The following image shows this graphically.

[![N|Solid](https://live.staticflickr.com/65535/50997579050_0a8bf3ef7e_z.jpg)](https://flic.kr/p/2kGtVwj)

---
# 2-Technical briefing about the PY UI 📋
 
you could check it out here:

```sh
cat ~/catkin_ws/src/rqt_mypkg/src/rqt_mypkg/my_module.py
```
### About the solution
The solution it is very easy the motion of the turtle may be paused, resumed or reset by using a service . Once the basic functionality described above is ready, created using the [RQT package](http://wiki.ros.org/rqt) and a simple Python UI to read a [JSON](https://es.wikipedia.org/wiki/JSON) files with a list of points that the robot must follow. 

- First, the main module **MyPlugin** starts all the UI enviroment and callback functions to each object.
- **addJsonCallback** just open a file dialog box, catch some coordinates and send it to the topic **/directions**
- **stopCallback**, **stopCallback**, and **stopCallback** callback functions just prepare the "**order**" to be send to robot's **manual_commands** server using the function  **manual_commands_client** .
---
# 3-Technical briefing about the web-based UI 📋
 
you could check it out here:

```sh
cat ~/catkin_ws/src/robot_gui_bridge/gui/gui.html
```
### About the solution
The solution takes the advantages of [roslib.min.js](https://github.com/RobotWebTools/roslibjs) which is the **"standard ROS javascript library"** and [nipplejs.js](https://github.com/yoannmoinet/nipplejs)  a very simple open source "virtual" joystick library.
The behavior is very simple:
- First, it starts the script by importing a minified version of roslib from Robot Web Tools
- Creates a series of snippets to create listeners for Ros event in this case to check connection event. 
- Subscribe to the **/feedback** topic created by the node **/robot** in order to catch from it the current turtle coordinates using a **Pose2D**<span id="a2">[²](#2)</span> message.
- It also subscribe to the turtle's **/pose** Here in order to catch also the coordinates but directrly from the robot adding the velocity (angular & linear) using a **turtlesim/Pose**<span id="a4">[⁴](#4)</span> message.
- In order to move the turtle with the joystick I use a pointer to turtle's **/cmd_vel** topic it uses a **Twist**<span id="a1">[¹](#1)</span> message, the function **move** generates all the coordinates.
- Finally, all the info is shown on the screen under the <body> tag

    The following image shows the UI running.

[![N|Solid](https://live.staticflickr.com/65535/51071163707_e9eedd6667.jpg)](https://flic.kr/p/2kNZ4Fi)

---
<span id="1">¹</span> Twist message

    File: geometry_msgs/Twist.msg
    Raw Message Definition
    This expresses velocity in free space broken into its linear and angular parts.
    
        Vector3  linear
        Vector3  angular
[⏎](#a1)<br>

<span id="2">²</span> Pose2d message

    File: geometry_msgs/Pose2D.msg
    Raw Message Definition
    This expresses a position and orientation on a 2D manifold.

           float64 x
           float64 y
           float64 theta
[⏎](#a2)<br>
 
<span id="3">³</span> Pose message

    File: geometry_msgs/Pose.msg
    Raw Message Definition
    A representation of pose in free space, composed of position and orientation. 

           Point position
           Quaternion orientation
[⏎](#a3)<br>

<span id="4">⁴</span> Turtle's Pose message

    File: turtlesim/Pose.msg
    Raw Message Definition
    float32 x
    float32 y
    float32 theta
    float32 linear_velocity
    float32 angular_velocity
[⏎](#a4)<br>

---
## Built with 🛠️


* [ROS "MELODIC"](http://wiki.ros.org/melodic) - ROS version used
* [UBUNTU 18.04](https://releases.ubuntu.com/18.04/) - Operating system
* [QT Designer](https://doc.qt.io/qt-5/qtdesigner-manual.html) - Tool used for Python's UI
* [Code::Blocks](https://www.codeblocks.org/) - Programming IDE 


## Author ✒️


* **Chris Beneduce** -  [chrisbeneduce](https://github.com/chrisbeneduce)



## Thanks 🎁

* Juan, Alejo and Fernando from Ekumen 🤓.


---


⌨️ by [chrisbeneduce](https://github.com/chrisbeneduce) 😊
