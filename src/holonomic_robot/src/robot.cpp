/*
 * Copyright (C) 2021, Christian Santos Beneduce, EKUMEN's CHALLENGE
 *
 *                    HOLONOMIC ROBOT EXECUTABLE
 *
 *  Main challenge module
 *
  * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the names of Stanford University or Willow Garage, Inc. nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include "ros/ros.h"
#include "holonomic_robot/ManualCommands.h"
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Pose2D.h"
#include "turtlesim/Pose.h"
#include "turtlesim/TeleportAbsolute.h"
#include <sstream>
#include <iostream>
#include <queue>
#include <math.h>

using namespace std;

// Global variables
const double PI = 3.14159265359;
queue <turtlesim::Pose> q;

/******* Helper functions *******/
double degrees2radians(double angle_in_degrees){
	return angle_in_degrees * PI / 180.0;
}
double getDistance(double x1, double y1, double x2, double y2) {
	return sqrt(pow((x1-x2),2)+pow((y1-y2),2));
}

// Robot class implementation
class Robot {
	private:
         /**
       * NodeHandle is the main access point to communications with the ROS system.
       * The first NodeHandle constructed will fully initialize this node, and the last
       * NodeHandle destructed will close down the node.
       */
		ros::NodeHandle n;
		ros::Publisher vel_pub;
		ros::Publisher feedback_pub;
		ros::Subscriber pose_sub;
		ros::Subscriber messages_sub;
		ros::ServiceServer service;
		ros::ServiceClient client;
		turtlesim::TeleportAbsolute srv;
		turtlesim::Pose turtlesim_pose;

	public:
		string order;
		turtlesim::Pose goal_pose;
		turtlesim::Pose aux_pose;
		geometry_msgs::Pose2D feedback_msg;
		geometry_msgs::Twist vel_msg;


		Robot() {

            /**
           * This advertise() function is how you tell ROS that you want to
           * publish on "/turtle1/cmd_vel" topic. This invokes a call to the ROS
           * master node, which keeps a registry of who is publishing and who
           * is subscribing. After this advertise() call is made, the master
           * node will notify anyone who is trying to subscribe to this topic name,
           * and they will in turn negotiate a peer-to-peer connection with this
           * node.  advertise() returns "vel_pub" object which allows you to
           * publish messages on that topic through a call to publish().  Once
           * all copies of the returned Publisher object are destroyed, the topic
           * will be automatically unadvertised.
           *
           * The second parameter to advertise(), in this case 10, is the size of the message queue
           * used for publishing messages.  If messages are published more quickly
           * than we can send them, the number here specifies how many messages to
           * buffer up before throwing some away.
           */
           vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
			cout << "Advertise to /turtle1/cmd_vel topic, DONE."<< endl;

           /**
           * This subscribe() call is how you tell ROS that you want to receive messages
           * from "directions" topic.  This invokes a call to the ROS
           * master node, which keeps a registry of who is publishing and who
           * is subscribing.  Messages are passed to "dirCallback" callback function
           * subscribe() returns a Subscriber object "messages_sub" that you
           * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
           * object go out of scope, this callback will automatically be unsubscribed from
           * this topic.
           *
           * The second parameter to the subscribe(), in this case is 10, function is the size of the message
           * queue.  If messages are arriving faster than they are being processed, this
           * is the number of messages that will be buffered up before beginning to throw
           * away the oldest ones.
           */

			messages_sub = n.subscribe("directions", 10, &Robot::dirCallback, this, ros::TransportHints().tcpNoDelay());
			cout << "Subscribe to directions topic, DONE.."<< endl;

           /**
           * This subscribe() call is how you tell ROS that you want to receive messages
           * from "/turtle1/pose" topic.  This invokes a call to the ROS
           * master node, which keeps a registry of who is publishing and who
           * is subscribing.  Messages are passed to "poseCallback" callback function
           * subscribe() returns a Subscriber object "pose_sub" that you
           * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
           * object go out of scope, this callback will automatically be unsubscribed from
           * this topic.
           *
           * The second parameter to the subscribe(), in this case is 10, function is the size of the message
           * queue.  If messages are arriving faster than they are being processed, this
           * is the number of messages that will be buffered up before beginning to throw
           * away the oldest ones.
           */
           pose_sub = n.subscribe("/turtle1/pose", 10, &Robot::poseCallback, this);
           cout << "Subscribe to /turtle1/pose topic, DONE..."<< endl;

	       /**
           * This advertise() function is how you tell ROS that you want to
           * publish on "feedback" topic. This invokes a call to the ROS
           * master node, which keeps a registry of who is publishing and who
           * is subscribing. After this advertise() call is made, the master
           * node will notify anyone who is trying to subscribe to this topic name,
           * and they will in turn negotiate a peer-to-peer connection with this
           * node.  advertise() returns "feedback_pub" object which allows you to
           * publish messages on that topic through a call to publish().  Once
           * all copies of the returned Publisher object are destroyed, the topic
           * will be automatically unadvertised.
           *
           * The second parameter to advertise(), in this case 10, is the size of the message queue
           * used for publishing messages.  If messages are published more quickly
           * than we can send them, the number here specifies how many messages to
           * buffer up before throwing some away.
           */
            feedback_pub = n.advertise<geometry_msgs::Pose2D>("feedback", 10);
			cout << "Advertise to feedback topic, DONE...."<< endl;

           /**
           * This advertiseService is how you tell ROS that you want to
           * publish that you provide a service, in this case named "manual_commands" by creating a
           * ros::ServiceServer through the ros::NodeHandle::advertiseService() method.
           * advertiseService() works very similar to how the subscribe() method works,
           * in that you provide a service name and a callback to be invoked when the service is called.
           * After this advertiseDervice() call is made, the master
           * node will notify anyone who is trying to subscribe to this service,
           * and they will in turn negotiate a peer-to-peer connection with this
           * node. Returns "service" object and Messages are passed to "process" callback function
           */
			service = n.advertiseService("manual_commands", &Robot::process, this);
			cout << "Advertise to manual_commands service, DONE....."<< endl;

           /**
           * This is how you tell ROS that you want to creates a client
           * for the "TeleportAbsolute" service of "turtlesim".
           * The ros::ServiceClient object named "client" is used to call the service later on.
           */
			client = n.serviceClient<turtlesim::TeleportAbsolute>("/turtle1/teleport_absolute");
			cout << "creates object pointing to turtlesim's TeleportAbsolute svc DONE......."<< endl;
			order = " ";
		}

		// main math and trigo function to position the robot
		void toGoal(turtlesim::Pose goal_pose, double tolerance) {
			const double Kv = 1.5;
			const double Kh = 3.5;

			ros::Rate loop_rate(10);

			 while(getDistance(turtlesim_pose.x, turtlesim_pose.y, goal_pose.x, goal_pose.y) > tolerance) {
	        if(order == "stop" || order == "reset") {
					vel_msg.linear.x = 0;
					vel_msg.angular.z = 0;
					if(order == "reset") {
						goal_pose.x = 5.54;
						goal_pose.y = 5.54;
						goal_pose.theta = 0;
						order = " ";
					}
				}
				else {
					vel_msg.linear.x = Kv * getDistance(turtlesim_pose.x, turtlesim_pose.y, goal_pose.x, goal_pose.y);
					vel_msg.linear.y = 0;
					vel_msg.linear.z = 0;
					vel_msg.angular.x = 0;
					vel_msg.angular.y = 0;
					vel_msg.angular.z = Kh * (atan2(goal_pose.y - turtlesim_pose.y, goal_pose.x - turtlesim_pose.x) - turtlesim_pose.theta);
				}

                cout << "linear vel x:"<<vel_msg.linear.x<< endl;

    			vel_pub.publish(vel_msg);
				ros::spinOnce();
				loop_rate.sleep();
			}

			vel_msg.linear.x = 0;
			vel_msg.angular.z = 0;
			vel_pub.publish(vel_msg);
			ros::spinOnce();
		}

		// Directions topic callback function
		void dirCallback(const geometry_msgs::Pose2D::ConstPtr &pose_message) {
			aux_pose.x = pose_message->x;
			aux_pose.y = pose_message->y;
			aux_pose.theta = pose_message->theta;
			q.push(aux_pose);
			cout << "X coordinate received: " << aux_pose.x << endl;
			cout << "Y coordinate recieved: " << aux_pose.y << endl;
			cout << "Theta coordinate recieved: " << aux_pose.theta << endl;
		}

		// Turtlesim current position callback function
		void poseCallback(const turtlesim::Pose::ConstPtr &pose_message) {
			/* Record current position */
			turtlesim_pose.x = pose_message->x;
			turtlesim_pose.y = pose_message->y;
			turtlesim_pose.theta = pose_message->theta;

			/* Send current position as feedback */
			feedback_msg.x = pose_message->x;
			feedback_msg.y = pose_message->y;
			feedback_msg.theta = pose_message->theta;

			feedback_pub.publish(feedback_msg);
			ros::spinOnce();
		}

		// Service call back function
		bool process(holonomic_robot::ManualCommands::Request  &req, holonomic_robot::ManualCommands::Response &res) {
			if(req.name == "turtle1") {
				if(req.order == "stop") {
                    order = req.order;
                    cout << "manual command rx:"<<order<< endl;

				}
				if(req.order == "resume") {
					order = "resume";
                    cout << "manual command rx:"<<order<< endl;
				}
				if(req.order == "reset") {
					order = "reset";
                    cout << "manual command rx:"<<order<< endl;;
					// Takes turtlesim to starting point
					goal_pose.x = 5.54;
					goal_pose.y = 5.54;
					goal_pose.theta = 0;

					srv.request.x = goal_pose.x;
  					srv.request.y = goal_pose.y;
  					srv.request.theta = goal_pose.theta;
					client.call(srv);
				}
			}
			return true;
		}

};
int main(int argc, char **argv)
{
	ros::init(argc, argv, "Robot");
	Robot r;

	ros::Rate loop_rate(10);

	while(ros::ok()) {

   /**
   * check the queue, it is not empty (data from "directions") pop them
   **/
		if(!q.empty()) {
			r.goal_pose = q.front();
			q.pop();
		}
	/**
   * call to main positioning using function
   *(uses "order" received from manual_commands | queued coordinates managed by directions| pose callback)
   * it makes all the math and trigo calculations and set cmd_vel
   **/
		r.toGoal(r.goal_pose, 0.01);
		loop_rate.sleep();
	}

	/**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
	ros::spin();
	return 0;
}
