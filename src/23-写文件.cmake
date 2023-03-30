set(MODULE_LIST_DECLARE_FILE "../gen/module_list.h")
set(MODULE_LIST_INIT_CALL_FILE "../gen/module_init_call.h")
set(MODULE_LIST
        user
        rtc
        game
        social
        sport
        iap)
set(MODULE_FULL_NAME_LIST)

file(WRITE ${MODULE_LIST_DECLARE_FILE} "")
file(WRITE ${MODULE_LIST_INIT_CALL_FILE} "")
foreach (elem IN LISTS MODULE_LIST)
    file(APPEND ${MODULE_LIST_DECLARE_FILE} "void ${elem}_init();\n")
    file(APPEND ${MODULE_LIST_INIT_CALL_FILE} "${elem}_init();\n")
    list(APPEND MODULE_FULL_NAME_LIST ${elem}_module)
endforeach (elem)