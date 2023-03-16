cmake的语法极其简单的，只有一种语法：
`functionName(参数列表)`。cmake每行一个指令，不需要以分号结尾，不需要缩进，不区分大小写。  
基于这个简单的原则，cmake实现了一些复杂的东西。例如定义宏
```plain
macro(<name> [arg1 [arg2 [arg3 ...]]])
  COMMAND1(ARGS ...)
  COMMAND2(ARGS ...)
  ...
endmacro(<name>)
```
macro和endmacro都是函数，cmakefile的编译器可以很容易地识别出`<name>`这个宏。以后看见了这个宏就知道怎么处理了。  

再比如function也是同样的道理
```plain
function(<name> [arg1 [arg2 [arg3 ...]]])
  COMMAND1(ARGS ...)
  COMMAND2(ARGS ...)
  ...
function(<name>)
```
循环也是函数
```plain
foreach(i RANGE 3)
    message(STATUS "current is ${i}")
endforeach(i)
```