@echo off

set ROOTDIR=%~dp0
set PROJECT_DIR=%RootDIR:~0,-1%
for %%I in (.) do set PROJECT=%%~nxI
set UPROJECT_PATH=%PROJECT_DIR%\%PROJECT%.uproject
set RELEASE_DIR=%PROJECT_DIR%\Releases

set UE5_DIR=C:\Program Files\Epic Games\UE_5.0
set UE5EDITOR_EXE=%UE5_DIR%\Engine\Binaries\Win64\UnrealEditor.exe
set UE5EDITOR_CMD=%UE5_DIR%\Engine\Binaries\Win64\UnrealEditor-cmd.exe
set BUILD_BAT=%UE5_DIR%\Engine\Build\BatchFiles\Build.bat
set RUNUAT_BAT=%UE5_DIR%\Engine\Build\BatchFiles\RunUAT.bat

set arg=%1
set dir=%2

IF %arg%==build (
	call "%BUILD_BAT%" %PROJECT%Editor Win64 Development "%UPROJECT_PATH%" -waitmutex -NoHotReload
)

IF %arg%==editor (
	call "%UE5EDITOR_EXE%" "%UPROJECT_PATH%" -log
)

IF %arg%==run (
	call "%UE5EDITOR_EXE%" "%UPROJECT_PATH%" -game -log -windowed -resx=1280 -resy=720
)

IF %arg%==buildexe (
	call "%BUILD_BAT%" %PROJECT% Win64 Development "%UPROJECT_PATH%" -waitmutex -NoHotReload
)

IF NOT DEFINED dir set dir=%RELEASE_DIR%
IF %arg%==ship (
	call "%RUNUAT_BAT%" BuildCookRun -project="%UPROJECT_PATH%" -noP4 -platform=Win64 -clientconfig=Shipping -serverconfig=Shipping -vr -cook -allmaps -Build -stage -pak -archive -archivedirectory="%dir%"
	call "%RUNUAT_BAT%" BuildCookRun -project="%UPROJECT_PATH%" -noP4 -platform=Win64 -clientconfig=Shipping -serverconfig=Shipping -vr -cook -allmaps -NoCompile -stage -pak -archive -archivedirectory="%dir%"
	xcopy /s/e "%PROJECT_DIR%\ThirdParty" "%dir%\Windows\%PROJECT%\ThirdParty\"
	xcopy /s "%PROJECT_DIR%\Binaries\Win64\opencv_videoio_ffmpeg454_64.dll" "%dir%\Windows\%PROJECT%\Binaries\Win64\"
	xcopy /s "%PROJECT_DIR%\Binaries\Win64\opencv_world454.dll" "%dir%\Windows\%PROJECT%\Binaries\Win64\"
)
