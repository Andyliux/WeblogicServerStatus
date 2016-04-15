@echo off
setlocal enableextensions 
set /p serverName="Enter Server Name: "
set "ports="
set /P ports="Enter target ports[default 7001,7003,7004]: "
if not defined ports set "ports=7001,7003,7004"
set /p userName="Enter UserName: "
set /p password="Enter Password: "

if "%1"=="" (set "commandType=cmd") else (set "commandType=conEmu")
call C:\Oracle\MW\wlserver_10.3\server\bin\setWLSEnv.cmd
java weblogic.WLST ServerStatus.py %serverName% %ports% %commandType% %userName% %password%
endlocal
pause>nul