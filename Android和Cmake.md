CMAKE_BUILD_TYPE 可以判断release还是debug。


[Android中的CMAKE](https://developer.android.com/ndk/guides/cmake?hl=zh-cn)

ANDROID_ABI：判断android是arm64还是arm32
ANDROID_ARM_MODE：如果Android ABI为armeabi-v7a，则生成的指令包括arm和thumb两类。  
ANDROID_ARM_NEON：如果Android ABI为armeabi-v7a，表示是否启用NEON支持，对其他ABI无影响。  
ANDROID_PLATFORM：android的minSDKVersion
ANDROID_STL：指定要为此应用使用的STL类型，默认情况下使用c++_static，即静态编译，把STL编译进程序里面。  
