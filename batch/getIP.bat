@echo off
setlocal enabledelayedexpansion

set "defaultInterface=Ethernet"

IF [%1] == [] (set "interface=%defaultInterface%") else (set interface=%1)

REM Run netsh to get the IP address of the Ethernet interface
for /f "tokens=*" %%a in ('netsh interface ipv4 show addresses "%interface%" ^| find "IP Address"') do (
    set "ipLine=%%a"
)

REM Extract the IP address from the line
for /f "tokens=2 delims=:" %%b in ("!ipLine!") do (
    set "ipAddress=%%b"
    set "ipAddress=!ipAddress: =!"
)

echo %ipAddress%

endlocal
