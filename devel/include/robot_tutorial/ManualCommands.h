// Generated by gencpp from file robot_tutorial/ManualCommands.msg
// DO NOT EDIT!


#ifndef ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDS_H
#define ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDS_H

#include <ros/service_traits.h>


#include <robot_tutorial/ManualCommandsRequest.h>
#include <robot_tutorial/ManualCommandsResponse.h>


namespace robot_tutorial
{

struct ManualCommands
{

typedef ManualCommandsRequest Request;
typedef ManualCommandsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ManualCommands
} // namespace robot_tutorial


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robot_tutorial::ManualCommands > {
  static const char* value()
  {
    return "bd763a4aa4ede563f73c7d9469f42e99";
  }

  static const char* value(const ::robot_tutorial::ManualCommands&) { return value(); }
};

template<>
struct DataType< ::robot_tutorial::ManualCommands > {
  static const char* value()
  {
    return "robot_tutorial/ManualCommands";
  }

  static const char* value(const ::robot_tutorial::ManualCommands&) { return value(); }
};


// service_traits::MD5Sum< ::robot_tutorial::ManualCommandsRequest> should match
// service_traits::MD5Sum< ::robot_tutorial::ManualCommands >
template<>
struct MD5Sum< ::robot_tutorial::ManualCommandsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robot_tutorial::ManualCommands >::value();
  }
  static const char* value(const ::robot_tutorial::ManualCommandsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_tutorial::ManualCommandsRequest> should match
// service_traits::DataType< ::robot_tutorial::ManualCommands >
template<>
struct DataType< ::robot_tutorial::ManualCommandsRequest>
{
  static const char* value()
  {
    return DataType< ::robot_tutorial::ManualCommands >::value();
  }
  static const char* value(const ::robot_tutorial::ManualCommandsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robot_tutorial::ManualCommandsResponse> should match
// service_traits::MD5Sum< ::robot_tutorial::ManualCommands >
template<>
struct MD5Sum< ::robot_tutorial::ManualCommandsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robot_tutorial::ManualCommands >::value();
  }
  static const char* value(const ::robot_tutorial::ManualCommandsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_tutorial::ManualCommandsResponse> should match
// service_traits::DataType< ::robot_tutorial::ManualCommands >
template<>
struct DataType< ::robot_tutorial::ManualCommandsResponse>
{
  static const char* value()
  {
    return DataType< ::robot_tutorial::ManualCommands >::value();
  }
  static const char* value(const ::robot_tutorial::ManualCommandsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDS_H
