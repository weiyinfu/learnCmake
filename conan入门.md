conan与vcpkg类似，是一种C++依赖管理工具。它基于Python实现，使用Python管理Cmake文件。   

# 安装conan
conan2与conan1.x区别很大，目前默认安装conan2。  
`pip install conan`

# conan官方文档
<https://docs.conan.io/2/tutorial/consuming_packages/build_simple_cmake_project.html>
# conan demo项目
`git clone https://github.com/conan-io/examples2.git`
# 主要配置文件
在项目目录下，使用conan.txt来描述依赖信息。 

在操作系统下，有profile信息：
```
[settings]
arch=x86_64
build_type=Release
compiler=apple-clang
compiler.cppstd=gnu17
compiler.libcxx=libc++
compiler.version=14
os=Macos
```

# 使用conan安装缺失文件
`conan install . --output-folder=build --build=missing`

# conan执行编译
```
$ cd build
$ cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
$ cmake --build .
...
```