cmake_minimum_required(VERSION 3.0)
project(test)
option (USE_MYMATH  "Use tutorial provided math implementation" off)


message("项目源码目录${project_source_dir}")
message("项目目标目录${project_binary_dir}")
configure_file (
  "./conf.h.in"
  "conf.h"
)
add_executable(main main.cpp)
