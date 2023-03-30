set(MODULE_LIST
        user
        rtc
        game
        social
        sport
        iap)

set(MODULE_LIST_DECLARE_FILE "")
set(MODULE_LIST_INIT_CALL_FILE "")
foreach (elem IN LISTS MODULE_LIST)
    string(APPEND MODULE_LIST_DECLARE_FILE "void ${elem}_init();\n")
    string(APPEND MODULE_LIST_INIT_CALL_FILE "  ${elem}_init();\n")
    string(APPEND MODULE_FULL_NAME_LIST ${elem}_module)

endforeach (elem)
string(CONCAT fileContent ${MODULE_LIST_DECLARE_FILE} "\nvoid initModules(){\n"  ${MODULE_LIST_INIT_CALL_FILE} "}")
message("${MODULE_LIST_DECLARE_FILE}")
message("${MODULE_LIST_INIT_CALL_FILE}")

message("${fileContent}")