// Generated by gencpp from file teb_local_planner/FeedbackMsg.msg
// DO NOT EDIT!


#ifndef TEB_LOCAL_PLANNER_MESSAGE_FEEDBACKMSG_H
#define TEB_LOCAL_PLANNER_MESSAGE_FEEDBACKMSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <teb_local_planner/TrajectoryMsg.h>
#include <costmap_converter/ObstacleArrayMsg.h>

namespace teb_local_planner
{
template <class ContainerAllocator>
struct FeedbackMsg_
{
  typedef FeedbackMsg_<ContainerAllocator> Type;

  FeedbackMsg_()
    : header()
    , trajectories()
    , selected_trajectory_idx(0)
    , obstacles_msg()  {
    }
  FeedbackMsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , trajectories(_alloc)
    , selected_trajectory_idx(0)
    , obstacles_msg(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::teb_local_planner::TrajectoryMsg_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::teb_local_planner::TrajectoryMsg_<ContainerAllocator> >> _trajectories_type;
  _trajectories_type trajectories;

   typedef uint16_t _selected_trajectory_idx_type;
  _selected_trajectory_idx_type selected_trajectory_idx;

   typedef  ::costmap_converter::ObstacleArrayMsg_<ContainerAllocator>  _obstacles_msg_type;
  _obstacles_msg_type obstacles_msg;





  typedef boost::shared_ptr< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> const> ConstPtr;

}; // struct FeedbackMsg_

typedef ::teb_local_planner::FeedbackMsg_<std::allocator<void> > FeedbackMsg;

typedef boost::shared_ptr< ::teb_local_planner::FeedbackMsg > FeedbackMsgPtr;
typedef boost::shared_ptr< ::teb_local_planner::FeedbackMsg const> FeedbackMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::teb_local_planner::FeedbackMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::teb_local_planner::FeedbackMsg_<ContainerAllocator1> & lhs, const ::teb_local_planner::FeedbackMsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.trajectories == rhs.trajectories &&
    lhs.selected_trajectory_idx == rhs.selected_trajectory_idx &&
    lhs.obstacles_msg == rhs.obstacles_msg;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::teb_local_planner::FeedbackMsg_<ContainerAllocator1> & lhs, const ::teb_local_planner::FeedbackMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace teb_local_planner

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e8086148d3a39de24ca2cc423f1e94e6";
  }

  static const char* value(const ::teb_local_planner::FeedbackMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe8086148d3a39de2ULL;
  static const uint64_t static_value2 = 0x4ca2cc423f1e94e6ULL;
};

template<class ContainerAllocator>
struct DataType< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "teb_local_planner/FeedbackMsg";
  }

  static const char* value(const ::teb_local_planner::FeedbackMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message that contains intermediate results \n"
"# and diagnostics of the (predictive) planner.\n"
"\n"
"std_msgs/Header header\n"
"\n"
"# The planned trajectory (or if multiple plans exist, all of them)\n"
"teb_local_planner/TrajectoryMsg[] trajectories\n"
"\n"
"# Index of the trajectory in 'trajectories' that is selected currently\n"
"uint16 selected_trajectory_idx\n"
"\n"
"# List of active obstacles\n"
"costmap_converter/ObstacleArrayMsg obstacles_msg\n"
"\n"
"\n"
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
"\n"
"================================================================================\n"
"MSG: teb_local_planner/TrajectoryMsg\n"
"# Message that contains a trajectory for mobile robot navigation\n"
"\n"
"std_msgs/Header header\n"
"teb_local_planner/TrajectoryPointMsg[] trajectory\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: teb_local_planner/TrajectoryPointMsg\n"
"# Message that contains single point on a trajectory suited for mobile navigation.\n"
"# The trajectory is described by a sequence of poses, velocities,\n"
"# accelerations and temporal information.\n"
"\n"
"# Why this message type?\n"
"# nav_msgs/Path describes only a path without temporal information.\n"
"# trajectory_msgs package contains only messages for joint trajectories.\n"
"\n"
"# The pose of the robot\n"
"geometry_msgs/Pose pose\n"
"\n"
"# Corresponding velocity\n"
"geometry_msgs/Twist velocity\n"
"\n"
"# Corresponding acceleration\n"
"geometry_msgs/Twist acceleration\n"
"\n"
"duration time_from_start\n"
"\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3 linear\n"
"Vector3 angular\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"================================================================================\n"
"MSG: costmap_converter/ObstacleArrayMsg\n"
"# Message that contains a list of polygon shaped obstacles.\n"
"# Special types:\n"
"# Polygon with 1 vertex: Point obstacle\n"
"# Polygon with 2 vertices: Line obstacle\n"
"# Polygon with more than 2 vertices: First and last points are assumed to be connected\n"
"\n"
"std_msgs/Header header\n"
"\n"
"costmap_converter/ObstacleMsg[] obstacles\n"
"\n"
"\n"
"================================================================================\n"
"MSG: costmap_converter/ObstacleMsg\n"
"# Special types:\n"
"# Polygon with 1 vertex: Point obstacle (you might also specify a non-zero value for radius)\n"
"# Polygon with 2 vertices: Line obstacle\n"
"# Polygon with more than 2 vertices: First and last points are assumed to be connected\n"
"\n"
"std_msgs/Header header\n"
"\n"
"# Obstacle footprint (polygon descriptions)\n"
"geometry_msgs/Polygon polygon\n"
"\n"
"# Specify the radius for circular/point obstacles\n"
"float64 radius\n"
"\n"
"# Obstacle ID\n"
"# Specify IDs in order to provide (temporal) relationships\n"
"# between obstacles among multiple messages.\n"
"int64 id\n"
"\n"
"# Individual orientation (centroid)\n"
"geometry_msgs/Quaternion orientation\n"
"\n"
"# Individual velocities (centroid)\n"
"geometry_msgs/TwistWithCovariance velocities\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Polygon\n"
"#A specification of a polygon where the first and last points are assumed to be connected\n"
"Point32[] points\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point32\n"
"# This contains the position of a point in free space(with 32 bits of precision).\n"
"# It is recommeded to use Point wherever possible instead of Point32.  \n"
"# \n"
"# This recommendation is to promote interoperability.  \n"
"#\n"
"# This message is designed to take up less space when sending\n"
"# lots of points at once, as in the case of a PointCloud.  \n"
"\n"
"float32 x\n"
"float32 y\n"
"float32 z\n"
"================================================================================\n"
"MSG: geometry_msgs/TwistWithCovariance\n"
"# This expresses velocity in free space with uncertainty.\n"
"\n"
"Twist twist\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
;
  }

  static const char* value(const ::teb_local_planner::FeedbackMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.trajectories);
      stream.next(m.selected_trajectory_idx);
      stream.next(m.obstacles_msg);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FeedbackMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::teb_local_planner::FeedbackMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::teb_local_planner::FeedbackMsg_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "header: ";
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "trajectories: ";
    if (v.trajectories.empty() || false)
      s << "[";
    for (size_t i = 0; i < v.trajectories.size(); ++i)
    {
      if (false && i > 0)
        s << ", ";
      else if (!false)
        s << std::endl << indent << "  -";
      Printer< ::teb_local_planner::TrajectoryMsg_<ContainerAllocator> >::stream(s, false ? std::string() : indent + "    ", v.trajectories[i]);
    }
    if (v.trajectories.empty() || false)
      s << "]";
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "selected_trajectory_idx: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.selected_trajectory_idx);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "obstacles_msg: ";
    Printer< ::costmap_converter::ObstacleArrayMsg_<ContainerAllocator> >::stream(s, indent + "  ", v.obstacles_msg);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEB_LOCAL_PLANNER_MESSAGE_FEEDBACKMSG_H
