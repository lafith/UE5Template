@echo off

call %~dp0\vars.bat

call "%UE5EDITOR_CMD%" "%UPROJECT_PATH%" -run=cook -targetplatform=Windows