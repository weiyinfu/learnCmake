* CMAKE_SYSTEM_NAME
编译安卓平台时请设置这个变量为Android。而且CMAKE_SYSTEM_VERSION必须指定。

* CMAKE_SYSTEM_VERSION
设置安卓的api level，假如未设置这个值，则会由以下两个方式决定：

* CMAKE_ANDROID_API设置了，则使用该api level
CMAKE_SYSROOT设置了，则使用该api level
都没设置，则使用ndk中最新的api level

* CMAKE_ANDROID_ARCH_ABI
arm64-v8a armeabi-v7a armeabi-v6 armeabi mips mips64 x86 x86_64。
这个牛逼了，设置abi架构，假如未设置，则使用默认的armeabi。设置了这个变量系统会自动设置CMAKE_ANDROID_ARCH，不必手动设置。


* CMAKE_ANDROID_NDK
这个更牛逼了，使用它来设置ndk的路径，必须是绝对路径，到ndk的根目录即可。

* CMAKE_ANDROID_NDK_DEPRECATED_HEADERS
设置为true，则会使用每个api level中已经废弃的头文件，而不会使用统一的头文件。默认为false，使用统一的头文件。

* CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION
设置NDK编译链的版本，假如不设置，则使用最新的。

* CMAKE_ANDROID_STL_TYPE
这个牛逼了。有好几个值：
  * none
  * No C++ Support
  * system
  * Minimal C++ without STL
  * gabi++_static
  * GAbi++ Static
  * gabi++_shared
  * GAbi++ Shared
  * gnustl_static
  * GNU libstdc++ Static
  * gnustl_shared
  * GNU libstdc++ Shared
  * c++_static
  * LLVM libc++ Static
  * c++_shared
  * LLVM libc++ Shared
  * stlport_static
  * STLport Static
  * stlport_shared
  * STLport Shared
默认值是gnustl_static。


* CMAKE_<LANG>_ANDROID_TOOLCHAIN_PREFIX
自动生成的，绝对路径的前缀。

* CMAKE_<LANG>_ANDROID_TOOLCHAIN_SUFFIX
自动生成的，绝对路径的后缀。
