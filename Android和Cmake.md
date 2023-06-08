CMAKE_BUILD_TYPE 可以判断release还是debug。


[Android中的CMAKE](https://developer.android.com/ndk/guides/cmake?hl=zh-cn)

ANDROID_ABI：判断android是arm64还是arm32
ANDROID_ARM_MODE：如果Android ABI为armeabi-v7a，则生成的指令包括arm和thumb两类。  
ANDROID_ARM_NEON：如果Android ABI为armeabi-v7a，表示是否启用NEON支持，对其他ABI无影响。  
ANDROID_PLATFORM：android的minSDKVersion
ANDROID_STL：指定要为此应用使用的STL类型，默认情况下使用c++_static，即静态编译，把STL编译进程序里面。  


# Android ABI
Android支持四种架构，分别是intel和arm的32位和64为架构，每一种架构有其独特的ABI(Application Binary Interface，应用程序二进制接口)。  
使用vcpkg编译NDK的时候，需要先安装好特定平台的包。

|VCPKG_TARGET_TRIPLET|	ANDROID_ABI|
|---|---|
|arm64-android|	arm64-v8a|
|arm-android|	armeabi-v7a|
|x64-android|	x86_64|
|x86-android|	x86|