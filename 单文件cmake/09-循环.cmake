foreach(i 0 1 2 3)
    message(STATUS "current is ${i}")
endforeach(i)
    message(STATUS "end")
endforeach(i)


foreach(i RANGE 3)
    message(STATUS "current is ${i}")
endforeach(i)

foreach(i RANGE 0 3 1)
message(STATUS "current is ${i}")
endforeach(i)