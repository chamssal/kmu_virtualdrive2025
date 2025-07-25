// Generated by gencpp from file morai_msgs/FaultInjection_Response.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_FAULTINJECTION_RESPONSE_H
#define MORAI_MSGS_MESSAGE_FAULTINJECTION_RESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <morai_msgs/FaultStatusInfo_Vehicle.h>
#include <morai_msgs/FaultStatusInfo_Sensor.h>

namespace morai_msgs
{
template <class ContainerAllocator>
struct FaultInjection_Response_
{
  typedef FaultInjection_Response_<ContainerAllocator> Type;

  FaultInjection_Response_()
    : result(false)
    , unique_id(0)
    , vehicle()
    , sensors()  {
    }
  FaultInjection_Response_(const ContainerAllocator& _alloc)
    : result(false)
    , unique_id(0)
    , vehicle(_alloc)
    , sensors(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;

   typedef int32_t _unique_id_type;
  _unique_id_type unique_id;

   typedef  ::morai_msgs::FaultStatusInfo_Vehicle_<ContainerAllocator>  _vehicle_type;
  _vehicle_type vehicle;

   typedef std::vector< ::morai_msgs::FaultStatusInfo_Sensor_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::morai_msgs::FaultStatusInfo_Sensor_<ContainerAllocator> >> _sensors_type;
  _sensors_type sensors;





  typedef boost::shared_ptr< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> const> ConstPtr;

}; // struct FaultInjection_Response_

typedef ::morai_msgs::FaultInjection_Response_<std::allocator<void> > FaultInjection_Response;

typedef boost::shared_ptr< ::morai_msgs::FaultInjection_Response > FaultInjection_ResponsePtr;
typedef boost::shared_ptr< ::morai_msgs::FaultInjection_Response const> FaultInjection_ResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::FaultInjection_Response_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::FaultInjection_Response_<ContainerAllocator1> & lhs, const ::morai_msgs::FaultInjection_Response_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result &&
    lhs.unique_id == rhs.unique_id &&
    lhs.vehicle == rhs.vehicle &&
    lhs.sensors == rhs.sensors;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::FaultInjection_Response_<ContainerAllocator1> & lhs, const ::morai_msgs::FaultInjection_Response_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "62056bf4fc5f4a1c260169ca104b9ebf";
  }

  static const char* value(const ::morai_msgs::FaultInjection_Response_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x62056bf4fc5f4a1cULL;
  static const uint64_t static_value2 = 0x260169ca104b9ebfULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/FaultInjection_Response";
  }

  static const char* value(const ::morai_msgs::FaultInjection_Response_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool result\n"
"\n"
"int32 unique_id\n"
"FaultStatusInfo_Vehicle vehicle\n"
"FaultStatusInfo_Sensor[] sensors\n"
"\n"
"================================================================================\n"
"MSG: morai_msgs/FaultStatusInfo_Vehicle\n"
"FaultStatusInfo_Overall accel\n"
"FaultStatusInfo_Overall brake\n"
"FaultStatusInfo_Overall steer\n"
"FaultStatusInfo_Overall[] tires\n"
"\n"
"\n"
"================================================================================\n"
"MSG: morai_msgs/FaultStatusInfo_Overall\n"
"bool status\n"
"int32[] fault_subclass\n"
"\n"
"================================================================================\n"
"MSG: morai_msgs/FaultStatusInfo_Sensor\n"
"int32 sensor_id\n"
"FaultStatusInfo_Overall sensor\n"
"\n"
;
  }

  static const char* value(const ::morai_msgs::FaultInjection_Response_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
      stream.next(m.unique_id);
      stream.next(m.vehicle);
      stream.next(m.sensors);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FaultInjection_Response_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::FaultInjection_Response_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::FaultInjection_Response_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "unique_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.unique_id);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "vehicle: ";
    Printer< ::morai_msgs::FaultStatusInfo_Vehicle_<ContainerAllocator> >::stream(s, indent + "  ", v.vehicle);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "sensors: ";
    if (v.sensors.empty() || false)
      s << "[";
    for (size_t i = 0; i < v.sensors.size(); ++i)
    {
      if (false && i > 0)
        s << ", ";
      else if (!false)
        s << std::endl << indent << "  -";
      Printer< ::morai_msgs::FaultStatusInfo_Sensor_<ContainerAllocator> >::stream(s, false ? std::string() : indent + "    ", v.sensors[i]);
    }
    if (v.sensors.empty() || false)
      s << "]";
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_FAULTINJECTION_RESPONSE_H
