@echo off

if not exist "build" mkdir build

set command=%1
pushd build
if "%command%" == "" call :make
if "%command%" == "clean" call :clean
if "%command%" == "vscode" call :vscode
popd
exit /b 0

:make
cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
ninja
exit /b

:clean
cd ..
del /s /q build\
rmdir /s /q build\
exit /b