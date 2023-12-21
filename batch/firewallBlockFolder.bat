@echo off

if "%1"=="" (
    echo Please provide the folder path as a command-line parameter.
    pause
    exit /b
)

set "folder=%1"

if not exist "%folder%" (
    echo Folder does not exist or is empty. Please specify a valid folder.
    pause
    exit /b
)



echo Files with .exe in %folder%:
for /R "%folder%" %%f in (*.exe) do (
  echo "%%f"
  echo "blocking outbound for %%f"
  netsh advfirewall firewall add rule name="z_out_cmd_block: %%f" dir=out program="%%f" action=block
  echo "blocking inbound for %%f"
  netsh advfirewall firewall add rule name="z_in_cmd_block: %%f" dir=in program="%%f" action=block
rem echo "%%f" | sed "s/:.*\\//"
rem echo "%%f" | sed "s/.*\\//"
)

rem pause
exit /b
rem netsh advfirewall firewall add rule name="z_cmd_block: %%f" dir=out program="%%f" action=block

rem echo Firewall rules added successfully.

rem Check if script was run from a command prompt
