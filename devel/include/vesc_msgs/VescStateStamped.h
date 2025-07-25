// Generated by gencpp from file vesc_msgs/VescStateStamped.msg
// DO NOT EDIT!


#ifndef VESC_MSGS_MESSAGE_VESCSTATESTAMPED_H
#define VESC_MSGS_MESSAGE_VESCSTATESTAMPED_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <vesc_msgs/VescState.h>

namespace vesc_msgs
{
template <class ContainerAllocator>
struct VescStateStamped_
{
  typedef VescStateStamped_<ContainerAllocator> Type;

  VescStateStamped_()
    : header()
    , state()  {
    }
  VescStateStamped_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , state(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::vesc_msgs::VescState_<ContainerAllocator>  _state_type;
  _state_type state;





  typedef boost::shared_ptr< ::vesc_msgs::VescStateStamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vesc_msgs::VescStateStamped_<ContainerAllocator> const> ConstPtr;

}; // struct VescStateStamped_

typedef ::vesc_msgs::VescStateStamped_<std::allocator<void> > VescStateStamped;

typedef boost::shared_ptr< ::vesc_msgs::VescStateStamped > VescStateStampedPtr;
typedef boost::shared_ptr< ::vesc_msgs::VescStateStamped const> VescStateStampedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vesc_msgs::VescStateStamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::vesc_msgs::VescStateStamped_<ContainerAllocator1> & lhs, const ::vesc_msgs::VescStateStamped_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.state == rhs.state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::vesc_msgs::VescStateStamped_<ContainerAllocator1> & lhs, const ::vesc_msgs::VescStateStamped_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace vesc_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vesc_msgs::VescStateStamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vesc_msgs::VescStateStamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vesc_msgs::VescStateStamped_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3a2b3a0e5b5f10ce6bbf973d767cdc4d";
  }

  static const char* value(const ::vesc_msgs::VescStateStamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3a2b3a0e5b5f10ceULL;
  static const uint64_t static_value2 = 0x6bbf973d767cdc4dULL;
};

template<class ContainerAllocator>
struct DataType< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vesc_msgs/VescStateStamped";
  }

  static const char* value(const ::vesc_msgs::VescStateStamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Timestamped VESC open source motor controller state (telemetry)\n"
"\n"
"Header  header\n"
"VescState state\n"
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
"\n"
"================================================================================\n"
"MSG: vesc_msgs/VescState\n"
"# Vedder VESC open source motor controller state (telemetry)\n"
"\n"
"# fault codes\n"
"int32 FAULT_CODE_NONE=0\n"
"int32 FAULT_CODE_OVER_VOLTAGE=1\n"
"int32 FAULT_CODE_UNDER_VOLTAGE=2\n"
"int32 FAULT_CODE_DRV8302=3\n"
"int32 FAULT_CODE_ABS_OVER_CURRENT=4\n"
"int32 FAULT_CODE_OVER_TEMP_FET=5\n"
"int32 FAULT_CODE_OVER_TEMP_MOTOR=6\n"
"\n"
"float64 voltage_input        # input voltage (volt)\n"
"float64 temperature_pcb      # temperature of printed circuit board (degrees Celsius)\n"
"float64 current_motor        # motor current (ampere)\n"
"float64 current_input        # input current (ampere)\n"
"float64 speed                # motor electrical speed (revolutions per minute) \n"
"float64 duty_cycle           # duty cycle (0 to 1)\n"
"float64 charge_drawn         # electric charge drawn from input (ampere-hour)\n"
"float64 charge_regen         # electric charge regenerated to input (ampere-hour)\n"
"float64 energy_drawn         # energy drawn from input (watt-hour)\n"
"float64 energy_regen         # energy regenerated to input (watt-hour)\n"
"float64 displacement         # net tachometer (counts)\n"
"float64 distance_traveled    # total tachnometer (counts)\n"
"int32   fault_code\n"
;
  }

  static const char* value(const ::vesc_msgs::VescStateStamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VescStateStamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vesc_msgs::VescStateStamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vesc_msgs::VescStateStamped_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "header: ";
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "state: ";
    Printer< ::vesc_msgs::VescState_<ContainerAllocator> >::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VESC_MSGS_MESSAGE_VESCSTATESTAMPED_H
