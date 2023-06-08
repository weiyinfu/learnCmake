学习Cmake

# 安装CMAKE
https://cmake.org/download/

mac下建议使用dmg直接安装。  
# cmake官方文档
https://cmake.org/cmake/help/latest/index.html
cmake用于生成make、ninja等文件。  
CMakeTutorial:https://github.com/BrightXiaoHan/CMakeTutorial
# ninja
gn、cmake、premake等编译处理工具相当于高级语言，它们的目标就是生成ninja这样的"汇编语言"。  
ninja的作用是"锦上添花"的，因为它位于比较底层的位置，大多数用户无需直接使用ninja。ninja的作用就是能够让减少文件改变到编译之间需要花费的时间。  
ninja的原理是更合理的处理依赖以及依赖发生变化之后应该执行的动作。  
ninja与make比较相似，但是ninja的语法是make的缩减版。  
ninja是google开发chrome的一位工程师的作品，它能够大大提升改动代码之后的编译速度。

https://ninja-build.org/manual.html#_tarball_extraction

# mac下clion默认的cmake路径

`${HOME}/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/223.8617.54/CLion.app/Contents/bin/cmake/mac/bin/cmake`

# meson
meson是一款用Python实现的构建系统。

# 构建工具大全
<https://zh.wikipedia.org/zh-tw/Category:%E8%87%AA%E5%8A%A8%E5%8C%96%E6%9E%84%E5%BB%BA>


1. make
2. cmake
3. gradle
4. maven
5. npm
6. yarn
7. msbuild
8. meson
9. ninja
10. autoconf
11. automake
12. autotools
13. Qmake
14. 