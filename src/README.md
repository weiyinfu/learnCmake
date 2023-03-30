如何运行本目录中的cmake文件？执行命令`cmake -P xxx.cmake`即可。  


1. Directory
   当CMake处理一个项目时，入口点是一个名为CMakeLists.txt的源文件，这个一定是根目录下的CMakeLists.txt。这个文件包含整个工程的构建规范，当我们有多个子文件夹需要编译时，使用add_subdirectory(<dir_name>)命令来为构建添加子目录。添加的每个子目录也必须包含一个CMakeLists.txt文件作为该子目录的入口点。每个子目录的CMakeLists.txt文件被处理时，CMake在构建树中生成相应的目录作为默认的工作和输出目录。记住这一点非常关键，这样我们就可以使用外部构建了，而不必每次都使用蛋疼的内部构建，然后删除一堆文件才能从新构建。
2. Script
   一个单独的<script>.cmake源文件可以使用cmake命令行工具`cmake -P <script>.cmake`选项来执行脚本。脚本模式只是在给定的文件中运行命令，并且不生成构建系统。它不允许CMake命令定义或执行构建目标。
3. Module
   在Directory或Script中，CMake代码可以使用include()命令来加载.cmake。cmake内置了许多模块用来帮助我们构建工程，前边文章中提到的CheckFunctionExists。也可以提供自己的模块，并在CMAKE_MODULE_PATH变量中指定它们的位置。

