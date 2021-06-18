
#  🚀
## _USING ROS FOR HOLONOMIC MOBILE ROBOTS_ 


 ## Context 
> A client is producing holonomic mobile robots, using a proprietary framework to send them to
target destinations in a 2D map that represents a floor plan. Their code grew unevenly since
their first demo, and there are raising concerns about its maintainability. Therefore, they
want to explore whether [ROS](http://www.ros.org/) is a good option to do the high level interface to operate the
robot, and get feedback from it.

 ## Task
> To show the client the possibilities that ROS offers, create a ROS node in C++ that makes
[turtlesim](http://wiki.ros.org/turtlesim) move to a goal ([x, y] point and orientation angle). Goals will be published into a
topic with the standard message format of [2D poses](http://docs.ros.org/en/api/geometry_msgs/html/msg/Pose2D.html) . Periodic feedback of turtle’s pose must
be provided using the same message type as the goals. In addition, the motion of the turtle
may be paused, resumed or reset by using a [service](http://wiki.ros.org/Services) .
Once the basic functionality described above is ready, create an [RQT Python UI](http://wiki.ros.org/rqt) to read a
[JSON](https://es.wikipedia.org/wiki/JSON) file with a list of points that the robot must follow. This UI shall provide the option of
pausing, resuming and resetting the turtle’s motion too.

## Deliverable
>The code must be delivered in the provided Github repository, with clear instructions
on how to build and execute the application.
[ROS Kinetic](http://wiki.ros.org/kinetic) with Ubuntu 16.04 or [ROS Melodic](http://wiki.ros.org/melodic) with Ubuntu 18.04 shall be used.

## Extra Points
> ● Show the pose of the robot in the browser using [roslibjs](http://wiki.ros.org/roslibjs).<br>
> ● Add tests to the code that you created.<br>
> ● Display the turtle’s speed and pose in the Web and / or the desktop interface.<br>
> ● Modify the interface to be able to teleoperate the turtle (i.e. move the robot around arbitrarily based on keyboard input).<br>
> ● Send the goals to the turtle using [ROS Actions](http://wiki.ros.org/actionlib) instead of plain topics, and display the provided feedback along the way.<br>

---
## Abstract 📋
### Why the client would use ROS?
ROS, which means Robot Operating System, is a set of software libraries and tools to help you build robot applications. The point of ROS is to create a robotics standard, bellow some key points:

- The same base code and knowledge can be applied to many different kinds of robots: robotic arms, drones, mobile bases, Once you’ve learned about how communication is done between all the nodes of the program, you can setup new parts of an application very easily. In the future, if you need to switch to a totally different robotics projects, you won’t be lost. You’ll be able to reuse what you know and some parts that you’ve built, so you’ll never really start from scratch again and reuse pre-existing code.
- There are many ROS packages for almost any robotic application.
- Despite ROS has mainly targeted C++ and Python, several libraries also allow to use of other languages and to communicate modules in different languages, is language "agnostic".
- ROS can work with multiple ROS masters. It means that you can have many independent robots, each with its own ROS system, and all robots can communicate with each other.
- ROS is very light, the core base of ROS doesn’t take much space and resources. You can quickly install the core packages and get started in a few minutes. You can also use ROS on embedded computers, such as Raspberry Pi 3 boards. 
- You can find many robotics products – such as grippers, controller boards, … – that already have a ROS package. So, in addition to the physical tool, the software that goes with it is directly compatible with your ROS system.
- ROS is open source




---
## Starting ⚙️  

Before repository installation it is needed to setup ROS and an environment in order to work properly, depending your Ubuntu distribution:

- [ROS](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment) - Installing and configuring ROS enviroment

After following the guidelines described in the link you will have [RosCore](http://wiki.ros.org/roscore) and a [CatKin](http://wiki.ros.org/catkin/conceptual_overview) Workspace ready to use.

Then you will be ready to install the repository from GitHub, open a terminal change to the desired working directory to clone the files and run

```sh
cd thisRepo
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
```
where "YOUR-USERNAME/YOUR-REPOSITORY" is the provided link of the repository

---
## STEPS TO START UP THE ENVIROMENT 🔧
***(multiple terminals will be needed)***

### 1-Starting Roscore
```sh
cd thisRepo
source ./devel/setup.bash
roscore
```
### 2-Running Tutrlesim

```sh
cd thisRepo
source ./devel/setup.bash
rosrun turtlesim turtlesim_node
```
### 3-Compilation
```sh
cd thisRepo
source ./devel/setup.bash
catkin_make
```
sometimes it is highly recommendable to force a complete compilation using
```sh
catkin_make --force-cmake
```

### 4-Running C++ "Robot" Node 
```sh
cd thisRepo
source ./devel/setup.bash
rosrun holonomic_robot robot
```
### 5-Running Python UI Plugin 
```sh
cd thisRepo`
source ./devel/setup.bash
rqt --standalone rqt_mypkg --force-discover
```
### 6-Sample data points found in:

```sh
cat thisRepo/src/rqt_mypkg/src/rqt_mypkg/JSON_files/
```

### 7-Sample "Dirs" Node used to enter manual coordinates :
```sh
cd thisRepo
source ./devel/setup.bash
rosrun holonomic_robot dirs
```
### 8-Extra points :
#### 8.1-Extra enviroment setup 🔧
To achieve this point I used [roslibjs](http://wiki.ros.org/roslibjs) and [rosbridge suite](http://wiki.ros.org/rosbridge_suite) is a set of packages that allows exchanging information between ROS and any other application capable of parsing JSON. This will allow us to exchange any information between ROS nodes and other applications (in our case an application running in the browser).
If you don't have it installed you could install the package manually using this command:  
```sh
cd thisRepo
apt-get install ros-melodic-rosbridge-server
```

I've added a very simple file at this path called **websocket.launch** to allow the server to run, you could check it out using this command
```sh
cat ~/catkin_ws/src/robot_gui_bridge/launch/websocket.launch
```

the fisrt time you have to run this:
```sh
cd thisRepo
cd ~/catkin_ws/
catkin build
```
#### 8.1-Running the server
```sh
cd thisRepo
source devel/setup.bash
roslaunch robot_gui_bridge websocket.launch
```
Important note: from this point, you don't need to execute **point 1** (**roscore**) because this server already launch it
#### 8.2-Running the web-based UI
I've added a simple web-based UI that uses [roslibjs](http://wiki.ros.org/roslibjs) and other simple scripts you can check it out here:

```sh
cat ~/catkin_ws/src/robot_gui_bridge/gui/gui.html
```
Open the UI in the browser of your choice, the detailed explanation of how it works inside is [here](https://github.com/chrisbeneduce/ROS_challenge/tree/master/src/readme.md) then come back to **point 2** and start turtlesim, robot, and the Python UI.



---
## Technical documentation about the project 📋


[follow this link](https://github.com/chrisbeneduce/ROS_challenge/tree/master/src/readme.md)

---

## Built with 🛠️


* [ROS "MELODIC"](http://wiki.ros.org/melodic) - ROS version used
* [UBUNTU 18.04](https://releases.ubuntu.com/18.04/) - Operating system
* [QT Designer](https://doc.qt.io/qt-5/qtdesigner-manual.html) - Tool used for Python's UI
* [Code::Blocks](https://www.codeblocks.org/) - Programming IDE 







---
⌨️ by [chrisbeneduce](https://github.com/chrisbeneduce) 😊
