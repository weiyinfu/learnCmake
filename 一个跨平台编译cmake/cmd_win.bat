@echo off

SET CMAKE_ROOT=%~dp0

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set BUILD_ROOT=%CMAKE_ROOT%build\windows
call:clean_dir %BUILD_ROOT%
call:build %BUILD_ROOT% ON
call:build %BUILD_ROOT% OFF

goto:eof

pause

:clean_dir
    set DIR=%1
    IF EXIST %DIR% (
        RD /S /Q %DIR%
    )
    MD %DIR%
goto:eof

:build
    set BUILD_ROOT=%1
    set BUILD_SHARED=%2

    SET BUILD_DIR=%BUILD_ROOT%\temp
    call:clean_dir %BUILD_DIR%

    cd %BUILD_DIR%
    cmake -GNinja -DBUILD_WIN=ON -DBUILD_SHARED=%BUILD_SHARED% -DCMAKE_BUILD_TYPE=RELEASE %CMAKE_ROOT%
    ninja -vj8
    ninja install
goto:eof