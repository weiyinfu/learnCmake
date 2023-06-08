cmake_minimum_required(VERSION 3.14)
project(my_project)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 14)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

option(BUILD_ANDROID "Build Android libraries" OFF)
option(BUILD_WIN "Build Win libraries" OFF)
option(BUILD_MAC "Build Mac libraries" OFF)
option(BUILD_IOS "Build ios libraries" OFF)
option(BUILD_LINUX "Build linux libraries" OFF)
option(BUILD_SHARED "Build shared library" OFF)
option(BUILD_BIT "Build bit" "64")
option(BUILD_MULTI_THREAD "support multi thread(static var using thread_local" ON)
option(PPF_BUILD "pico export function" ON)
option(WIN_USE_DLL "/MT or /MD" ON)
option(WITH_GAME_RHINO "With game rhino" OFF)

message(STATUS "C compiler: ${CMAKE_C_COMPILER}, version: "
        "${CMAKE_C_COMPILER_ID} ${CMAKE_C_COMPILER_VERSION}")
message(STATUS "CXX compiler: ${CMAKE_CXX_COMPILER}, version: "
        "${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "AR tools: ${CMAKE_AR}")
message(STATUS "STRIP tools: ${CMAKE_STRIP}")

if (WITH_GAME_RHINO)
    add_compile_definitions(WITH_GAME_RHINO)
endif ()

if(BUILD_WIN)
    if (WIN_USE_DLL) #(NOT BUILD_SHARED)
        foreach(flag_var
                CMAKE_C_FLAGS CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_RELEASE
                CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELWITHDEBINFO
                CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
                CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
            if(${flag_var} MATCHES "/MT")
                string(REGEX REPLACE "/MT" "/MD" ${flag_var} "${${flag_var}}")
            endif()
        endforeach()
    else()
        foreach(flag_var
            CMAKE_C_FLAGS CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_RELEASE
            CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELWITHDEBINFO
            CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
            CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
            if(${flag_var} MATCHES "/MD")
                string(REGEX REPLACE "/MD" "/MT" ${flag_var} "${${flag_var}}")
            endif()
        endforeach()
    endif()

    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /MP /wd4100 /utf-8")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /wd4100 /utf-8")
else()
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -Wall -Werror -Wextra -Wno-unused-parameter -Wformat=2 -Wno-format-nonliteral")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -Wall -Werror -Wextra -Wno-unused-parameter -Wformat=2 -Wno-format-nonliteral")
    if (BUILD_LINUX)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unknown-pragmas -Wno-type-limits -g")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas -Wno-type-limits -g")
    endif ()
endif()

set(THIRD_INSTALL_FILES)

include(${PROJECT_SOURCE_DIR}/cmake/install_file_suffix.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/output_binary_dir.cmake)

if(BUILD_ANDROID)
    add_definitions(-DANDROID)
    include(cmake/android.cmake)
elseif(BUILD_IOS)
    set(BUILD_SHARED OFF)
endif()

include(${PROJECT_SOURCE_DIR}/cmake/dep_stark_net.cmake)
########################################################
# c/cpp rpc imp ...
if(BUILD_SHARED)
    add_definitions(-DPPF_DLL_BUILD) 
else()
    add_definitions(-DPPF_STATIC_BUILD) 
endif()

set(TARGET_LIB_CRPC stark_cs_rpc)
set(TARGET_LIB_SRC_CRPC ${TARGET_LIB_SRC_CRPC} xxxx/xxxx.cc)
set(TARGET_LIB_SRC_RPCIMP xxxx.cc)
set(TARGET_LIB_SRC_MOD ${TARGET_LIB_SRC_CRPC} xxxxxx.cc bg_rpc/mods/some_client_mod_c.cc)
set(TARGET_COMMON_SRC_CRPC xxxxx.cc)
set(TARGET_COMMON_SRC_CRPC ${TARGET_COMMON_SRC_CRPC} xxxxxxx.cpp)

set(LIB_TYPE)
if (BUILD_SHARED)
    set(LIB_TYPE SHARED)
else()
    set(LIB_TYPE STATIC)
endif()

if(BUILD_WIN)
    set(LIB_TYPE STATIC)
endif()

add_library(${TARGET_LIB_CRPC} ${LIB_TYPE} ${TARGET_LIB_SRC_CRPC} ${TARGET_LIB_SRC_RPCIMP} ${TARGET_LIB_SRC_MOD} ${TARGET_COMMON_SRC_CRPC})

set_target_properties(${TARGET_LIB_CRPC} PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_include_directories(${TARGET_LIB_CRPC} PUBLIC ${PROJECT_SOURCE_DIR}/xxxxx)

add_library(stark_pico_mock ${LIB_TYPE} xxx.cpp xxx2.cpp)
target_include_directories(stark_pico_mock PUBLIC ${PROJECT_SOURCE_DIR}/xxxx)
target_include_directories(stark_pico_mock PUBLIC ${PROJECT_SOURCE_DIR}/xxx)

add_subdirectory(xxxx)
if(BUILD_WIN OR BUILD_MAC OR BUILD_LINUX)
    add_subdirectory(test)
    #add_subdirectory(unit_test)
endif()
########################################################

if(BUILD_WIN)
    if(NOT BUILD_SHARED)
        set(INSTALL_FILES
                ${CMAKE_BINARY_DIR}/${TARGET_LIB_CRPC}.${INSTALL_FILE_SUFFIX}
                ${CMAKE_BINARY_DIR}/xxx.${INSTALL_FILE_SUFFIX}
                )
    endif()
elseif(BUILD_IOS)
    if ("${PLATFORM}" STREQUAL "SIMULATOR64")
        set(INSTALL_FILES
                ${CMAKE_BINARY_DIR}/Release-iphonesimulator/lib${TARGET_LIB_CRPC}.${INSTALL_FILE_SUFFIX}
                )
    else()
        set(INSTALL_FILES
                ${CMAKE_BINARY_DIR}/Release-iphoneos/lib${TARGET_LIB_CRPC}.${INSTALL_FILE_SUFFIX}
                )
    endif ()
else()
    set(INSTALL_FILES
            ${CMAKE_BINARY_DIR}/lib${TARGET_LIB_CRPC}.${INSTALL_FILE_SUFFIX}
            ${CMAKE_BINARY_DIR}/libstark_pico_mock.${INSTALL_FILE_SUFFIX}
            )
endif()

if(THIRD_INSTALL_FILES)
    set(INSTALL_FILES ${INSTALL_FILES} ${THIRD_INSTALL_FILES})
endif()

install(FILES ${INSTALL_FILES} DESTINATION ${OUTPUT_BINARY_DIR})

if(BUILD_ANDROID)
    if(BUILD_SHARED)
        install(CODE "execute_process(COMMAND bash -c \"for f in ${OUTPUT_BINARY_DIR}/*.${INSTALL_FILE_SUFFIX} ; do echo ${CMAKE_STRIP} $f && ${CMAKE_STRIP} $f ; done\")")
        install(FILES ${CMAKE_BINARY_DIR}/libc++_shared.so DESTINATION ${OUTPUT_BINARY_DIR})
    endif()
endif()
