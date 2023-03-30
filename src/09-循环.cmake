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


set(A 0;1)
set(B 2 3)
set(C "4 5")
set(D 6;7 8)
set(E "")
foreach(X IN LISTS A B C D E)
    message(STATUS "X=${X}")
endforeach()



list(APPEND English one two three four)
list(APPEND Bahasa satu dua tiga)

foreach(num IN ZIP_LISTS English Bahasa)
    message(STATUS "num_0=${num_0}, num_1=${num_1}")
endforeach()

foreach(en ba IN ZIP_LISTS English Bahasa)
    message(STATUS "en=${en}, ba=${ba}")
endforeach()