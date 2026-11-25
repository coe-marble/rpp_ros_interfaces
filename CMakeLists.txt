cmake_minimum_required(VERSION 3.15)
project(rpp_ros_interfaces)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(action_msgs REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(std_msgs REQUIRED)

# Organize source definitions by domain. rosidl requires canonical msg/, srv/
# and action/ paths, so stage an ordinary ROS package layout for generation.
file(GLOB_RECURSE interface_sources CONFIGURE_DEPENDS RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "msg/*.msg" "srv/*.srv" "action/*.action")
set(interface_files)
set(interface_names)
foreach(source IN LISTS interface_sources)
  string(REGEX MATCH "^(msg|srv|action)" kind "${source}")
  get_filename_component(name "${source}" NAME)
  if("${kind}/${name}" IN_LIST interface_names)
    message(FATAL_ERROR "Repeated ROS interface name: ${kind}/${name}")
  endif()
  list(APPEND interface_names "${kind}/${name}")
  set(staging "${CMAKE_CURRENT_BINARY_DIR}/interfaces")
  configure_file("${source}" "${staging}/${kind}/${name}" COPYONLY)
  list(APPEND interface_files "${staging}:${kind}/${name}")
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME} ${interface_files}
  DEPENDENCIES action_msgs builtin_interfaces geometry_msgs nav_msgs std_msgs)
ament_export_dependencies(rosidl_default_runtime)
ament_package()
