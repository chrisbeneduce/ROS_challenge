// Generated by gencpp from file robot_tutorial/ManualCommandsRequest.msg
// DO NOT EDIT!


#ifndef ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDSREQUEST_H
#define ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_tutorial
{
template <class ContainerAllocator>
struct ManualCommandsRequest_
{
  typedef ManualCommandsRequest_<ContainerAllocator> Type;

  ManualCommandsRequest_()
    : name()
    , order()  {
    }
  ManualCommandsRequest_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , order(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _order_type;
  _order_type order;





  typedef boost::shared_ptr< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ManualCommandsRequest_

typedef ::robot_tutorial::ManualCommandsRequest_<std::allocator<void> > ManualCommandsRequest;

typedef boost::shared_ptr< ::robot_tutorial::ManualCommandsRequest > ManualCommandsRequestPtr;
typedef boost::shared_ptr< ::robot_tutorial::ManualCommandsRequest const> ManualCommandsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator1> & lhs, const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator2> & rhs)
{
  return lhs.name == rhs.name &&
    lhs.order == rhs.order;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator1> & lhs, const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_tutorial

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68d737f79d05f32ec5b9d05672f53626";
  }

  static const char* value(const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68d737f79d05f32eULL;
  static const uint64_t static_value2 = 0xc5b9d05672f53626ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_tutorial/ManualCommandsRequest";
  }

  static const char* value(const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"string order\n"
;
  }

  static const char* value(const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.order);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ManualCommandsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_tutorial::ManualCommandsRequest_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "order: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.order);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_TUTORIAL_MESSAGE_MANUALCOMMANDSREQUEST_H
