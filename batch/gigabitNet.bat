@echo off

set "gigabitIP=xxx.xxx.xxx.xxx"
set "mask=xxx.xxx.xxx.xxx"
set "gateway=xxx.xxx.xxx.xxx"
set "dns1=xxx.xxx.xxx.xxx"
set "dns2=xxx.xxx.xxx.xxx"
set "defaultInterface=xxxxxxxxxxxxxxxxx"

IF [%1] == [] (set "interface=%defaultInterface%") else (set interface=%1)

for /f %%a in ('getIP') do (
    set "ip=%%a"
)

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\UAC.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\UAC.vbs"
    "%temp%\UAC.vbs"
    rem del "%temp%\UAC.vbs"
) else (
    if "%ip%" == "%gigabitIP%" (
        echo turning off gigabit!
        echo on: %interface%
        netsh interface ipv4 set address name="%interface%" source=dhcp
        pause
    ) else (
        echo turning on gigabit!
        echo on: %interface%
        netsh interface ipv4 set address name="%interface%" static %gigabitIP% %mask% %gateway%
        REM netsh interface ipv4 set dns name="%interface%" static %dns1% %dns2%
        netsh interface ipv4 set dns name=%interface% static %dns1% primary
        netsh interface ipv4 add dns name=%interface% %dns2% index=2
        pause
    )
)
