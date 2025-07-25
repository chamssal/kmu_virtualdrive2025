// Generated by gencpp from file morai_msgs/MoraiSyncModeRemoveObjectSrvRequest.msg
// DO NOT EDIT!


#ifndef MORAI_MSGS_MESSAGE_MORAISYNCMODEREMOVEOBJECTSRVREQUEST_H
#define MORAI_MSGS_MESSAGE_MORAISYNCMODEREMOVEOBJECTSRVREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <morai_msgs/SyncModeRemoveObject.h>

namespace morai_msgs
{
template <class ContainerAllocator>
struct MoraiSyncModeRemoveObjectSrvRequest_
{
  typedef MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> Type;

  MoraiSyncModeRemoveObjectSrvRequest_()
    : request()  {
    }
  MoraiSyncModeRemoveObjectSrvRequest_(const ContainerAllocator& _alloc)
    : request(_alloc)  {
  (void)_alloc;
    }



   typedef  ::morai_msgs::SyncModeRemoveObject_<ContainerAllocator>  _request_type;
  _request_type request;





  typedef boost::shared_ptr< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MoraiSyncModeRemoveObjectSrvRequest_

typedef ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<std::allocator<void> > MoraiSyncModeRemoveObjectSrvRequest;

typedef boost::shared_ptr< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest > MoraiSyncModeRemoveObjectSrvRequestPtr;
typedef boost::shared_ptr< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest const> MoraiSyncModeRemoveObjectSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator1> & lhs, const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.request == rhs.request;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator1> & lhs, const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace morai_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f29d91eaba9c9b9e22406f170d281a6c";
  }

  static const char* value(const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf29d91eaba9c9b9eULL;
  static const uint64_t static_value2 = 0x22406f170d281a6cULL;
};

template<class ContainerAllocator>
struct DataType< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "morai_msgs/MoraiSyncModeRemoveObjectSrvRequest";
  }

  static const char* value(const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "SyncModeRemoveObject request\n"
"\n"
"================================================================================\n"
"MSG: morai_msgs/SyncModeRemoveObject\n"
"int32 unique_id\n"
"uint64 frame\n"
;
  }

  static const char* value(const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.request);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoraiSyncModeRemoveObjectSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::morai_msgs::MoraiSyncModeRemoveObjectSrvRequest_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "request: ";
    Printer< ::morai_msgs::SyncModeRemoveObject_<ContainerAllocator> >::stream(s, indent + "  ", v.request);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MORAI_MSGS_MESSAGE_MORAISYNCMODEREMOVEOBJECTSRVREQUEST_H
