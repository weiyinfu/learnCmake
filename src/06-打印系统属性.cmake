
cmake_host_system_information(RESULT numberLogicCpu QUERY NUMBER_OF_LOGICAL_CORES)
cmake_host_system_information(RESULT numberPhysicalCpu QUERY NUMBER_OF_PHYSICAL_CORES)
cmake_host_system_information(RESULT hostname QUERY HOSTNAME)
cmake_host_system_information(RESULT FQDN QUERY FQDN)
cmake_host_system_information(RESULT OS_NAME QUERY OS_NAME)
cmake_host_system_information(RESULT PROCESSOR_NAME QUERY PROCESSOR_NAME)
cmake_host_system_information(RESULT OS_PLATFORM QUERY OS_PLATFORM)
cmake_host_system_information(RESULT OS_VERSION QUERY OS_VERSION)

message(逻辑核数${numberLogicCpu})
message(物理核数${numberPhysicalCpu})
message(hostName${hostName})
message(域名${FQDN})
message(操作系统名称${OS_NAME})
message(处理器名称${PROCESSOR_NAME})
message(OS平台${OS_PLATFORM})
message(操作系统版本:${OS_VERSION})


message(环境变量PATH:$ENV{PATH})