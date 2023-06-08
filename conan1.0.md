conan.txt
```
[requires]
poco/1.9.4
libiconv/1.16
thrift/0.15.0
openssl/1.1.1l
boost/1.78.0
nlohmann_json/3.11.2
protobuf/3.13.0
zlib/1.2.12
cpp-httplib/0.11.1
eigen/3.4.0
msgpack/3.3.0
toml11/3.7.1
[generators]
cmake
```

在2.0中generators需要改成
```
[requires]
poco/1.9.4
boost/1.81.0
nlohmann_json/3.11.2
cpp-httplib/0.11.1
eigen/3.4.0
toml11/3.7.1
protobuf/3.21.9
zlib/1.2.13
msgpack-cxx/6.0.0
[generators]
CMakeDeps
CMakeToolchain
```


在1.0中，直接在头部设置conanbuildinfo.cmake即可包含全部的依赖
```
cmake_minimum_required(VERSION 3.21)
project(learnCpp)

set(CMAKE_CXX_STANDARD 14)
set(CONAN_DISABLE_CHECK_COMPILER 1)
include(build/conanbuildinfo.cmake)
conan_basic_setup()
include(gen.cmake)

add_executable(protobuf_v2 150-protobuf/01-protobuf和json.cpp 150-protobuf/gen/haha.pb.cc 150-protobuf/proto2json/proto2json.cpp)
target_link_libraries(protobuf_v2  ${CONAN_LIBS})

```

核心是两句话：
```
include(build/conanbuildinfo.cmake)
conan_basic_setup()
```
在使用的时候，只需要链接CONAN_LIBS即可。  
```
add_executable(targetaa834028fe96c1fe7c6aac43be5a3c5a 001-learnCpp/450-lambda表达式.cpp)
target_link_libraries(targetaa834028fe96c1fe7c6aac43be5a3c5a  ${CONAN_LIBS})
```

conan1.0到了1.59.0基本上就不更新了，conan2.0只能使用find_package语句具体指定依赖，使用上更为麻烦。  
