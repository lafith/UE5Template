@echo off

set ROOTDIR=%~dp0
set PROJECT_DIR=%RootDIR:~0,-1%
for %%I in (.) do set PROJECT=%%~nxI
set UPROJECT_PATH=%PROJECT_DIR%\%PROJECT%.uproject


set UE5_DIR=C:\Program Files\Epic Games\UE_5.0EA
set UE5EDITOR_EXE=%UE5_DIR%\Engine\Binaries\Win64\UnrealEditor.exe
set UE5EDITOR_CMD=%UE5_DIR%\Engine\Binaries\Win64\UnrealEditor-cmd.exe
set BUILD_BAT=%UE5_DIR%\Engine\Build\BatchFiles\Build.bat