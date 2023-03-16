官方文档：https://cmake.org/cmake/help/latest/command/find_package.html

在开源世界中，库的提供者通常需要提供`<package-name>Config.cmake`或者`Find<package-name>.cmake`，这样便于使用者进行集成。
find_package这个命令有两种工作模式：
* module模式：基础工作模式，也是默认的工作模式，它查找的是Find<package-name>.cmake文件。
* config模式：高级工作模式，只有find_package参数中指定CONFIG、NO_MODULE等关键字的时候、或者是module模式失败的时候才会进入Config模式。它查找的是<package-name>Config.cmake

```plain
find_package(<package> [version] [EXACT] [QUIET] [MODULE]
             [REQUIRED] [[COMPONENTS] [components...]]
             [OPTIONAL_COMPONENTS components...]
             [NO_POLICY_SCOPE])
```
参数解释：
* package：必填参数。需要查找的包名，注意大小写。
* version和EXACT：可选参数，version指定的是版本，如果指定就必须检查找到的包的版本是否和version兼容。如果指定EXACT则表示必须完全匹配的版本而不是兼容版本就可以。

* QUIET：可选参数，表示如果查找失败，不会在屏幕进行输出（但是如果指定了REQUIRED字段，则QUIET无效，仍然会输出查找失败提示语）。

* MODULE：可选字段。前面提到说“如果Module模式查找失败则回退到Config模式进行查找”，但是假如加入了MODULE选项，那么就只在Module模式查找，如果Module模式下查找失败并不切换到Config模式查找。

* REQUIRED：可选字段。表示一定要找到包，找不到的话就立即停掉整个CMake。而如果不指定REQUIRED则CMake会继续执行。

* COMPONENTS，components：可选字段，表示查找的包中必须要找到的组件(components），如果有任何一个找不到就算失败，类似于REQUIRED，导致CMake停止执行。


# module模式的查找顺序
module模式只有两个查找路径，CMAKE_MODULE_PATH和cmake安装路径下的Modules目录。

# config模式
config模式查找报的时候我们可以提供一些提示信息。  
```plain
find_package(<package> [version] [EXACT] [QUIET]
             [REQUIRED] [[COMPONENTS] [components...]]
             [CONFIG|NO_MODULE]
             [NO_POLICY_SCOPE]
             [NAMES name1 [name2 ...]]
             [CONFIGS config1 [config2 ...]]
             [HINTS path1 [path2 ... ]]
             [PATHS path1 [path2 ... ]]
             [PATH_SUFFIXES suffix1 [suffix2 ...]]
             [NO_DEFAULT_PATH]
             [NO_CMAKE_ENVIRONMENT_PATH]
             [NO_CMAKE_PATH]
             [NO_SYSTEM_ENVIRONMENT_PATH]
             [NO_CMAKE_PACKAGE_REGISTRY]
             [NO_CMAKE_BUILDS_PATH] # Deprecated; does nothing.
             [NO_CMAKE_SYSTEM_PATH]
             [NO_CMAKE_SYSTEM_PACKAGE_REGISTRY]
             [CMAKE_FIND_ROOT_PATH_BOTH |
              ONLY_CMAKE_FIND_ROOT_PATH |
              NO_CMAKE_FIND_ROOT_PATH])
```

例如要查找的包名叫做protobuf，定义protobuf_DIR变量为protobufConfig.cmake所在的路径，就能够帮助cmake快速找到protobuf。  
find_package的作用是什么？实际上就是设置两个环境变量，一个是protobuf_INCLUDE_DIRS，另一个就是protobuf_LIBRARIES。这两个变量就是由protobufConfig.cmake这个文件所设置的。   
Config模式下是要查找名为<PackageName>Config.cmake或<lower-case-package-name>-config.cmake的模块文件。它的查找顺序为：
* 首先寻找`<PackageName>_DIR`这个变量或者环境变量。
* 名为CMAKE_PREFIX_PATH、CMAKE_FRAMEWORK_PATH、CMAKE_APPBUNDLE_PATH的CMake变量或环境变量路径。
* PATH环境变量。cmake会检查PATH环境变量附近（这是一个比较模糊的描述）是否存在`<package-name>Config.cmake`。
