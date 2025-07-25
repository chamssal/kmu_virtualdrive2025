// Generated by gencpp from file morai_msgs/PRStatus.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_PRSTATUS_H
#define MORAI_MSGS_MESSAGE_PRSTATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace morai_msgs
{
template <class ContainerAllocator>
struct PRStatus_
{
  typedef PRStatus_<ContainerAllocator> Type;

  PRStatus_()
    : header()
    , position_X(0.0)
    , position_Y(0.0)
    , position_Z(0.0)
    , heading(0.0)
    , mountStatus(false)  {
    }
  PRStatus_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , position_X(0.0)
    , position_Y(0.0)
    , position_Z(0.0)
    , heading(0.0)
    , mountStatus(false)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _position_X_type;
  _position_X_type position_X;

   typedef float _position_Y_type;
  _position_Y_type position_Y;

   typedef float _position_Z_type;
  _position_Z_type position_Z;

   typedef double _heading_type;
  _heading_type heading;

   typedef uint8_t _mountStatus_type;
  _mountStatus_type mountStatus;





  typedef boost::shared_ptr< ::morai_msgs::PRStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::PRStatus_<ContainerAllocator> const> ConstPtr;

}; // struct PRStatus_

typedef ::morai_msgs::PRStatus_<std::allocator<void> > PRStatus;

typedef boost::shared_ptr< ::morai_msgs::PRStatus > PRStatusPtr;
typedef boost::shared_ptr< ::morai_msgs::PRStatus const> PRStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::PRStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::PRStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::PRStatus_<ContainerAllocator1> & lhs, const ::morai_msgs::PRStatus_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.position_X == rhs.position_X &&
    lhs.position_Y == rhs.position_Y &&
    lhs.position_Z == rhs.position_Z &&
    lhs.heading == rhs.heading &&
    lhs.mountStatus == rhs.mountStatus;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::PRStatus_<ContainerAllocator1> & lhs, const ::morai_msgs::PRStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::PRStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::PRStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::PRStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::PRStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::PRStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::PRStatus_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::PRStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3717aef8039c3cd46c25aa8ac584e9d9";
  }

  static const char* value(const ::morai_msgs::PRStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3717aef8039c3cd4ULL;
  static const uint64_t static_value2 = 0x6c25aa8ac584e9d9ULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::PRStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/PRStatus";
  }

  static const char* value(const ::morai_msgs::PRStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::PRStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"float32 position_X\n"
"float32 position_Y\n"
"float32 position_Z\n"
"float64 heading\n"
"bool mountStatus\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::morai_msgs::PRStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::PRStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.position_X);
      stream.next(m.position_Y);
      stream.next(m.position_Z);
      stream.next(m.heading);
      stream.next(m.mountStatus);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PRStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::PRStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::PRStatus_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "header: ";
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "position_X: ";
    Printer<float>::stream(s, indent + "  ", v.position_X);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "position_Y: ";
    Printer<float>::stream(s, indent + "  ", v.position_Y);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "position_Z: ";
    Printer<float>::stream(s, indent + "  ", v.position_Z);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "heading: ";
    Printer<double>::stream(s, indent + "  ", v.heading);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "mountStatus: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.mountStatus);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_PRSTATUS_H
