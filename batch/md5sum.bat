@echo off
for %%x in (%*) do (
  for /F "tokens=*" %%n in ('certutil -hashfile "%%~x" MD5') do (
    set out = %%n

    echo %%n | >nul findstr /i /r /c:"^MD5 hash of.*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"[abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890].*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^CertUtil:.*" && ( echo: )
    rem echo ">>>>" %%n
    rem echo:

    rem set mode = 0
    rem for /F "tokens=*" %%m in ('echo %%n | findstr /i /r /c:"MD5 hash of.*" %%n') do (
    rem   set mode = 1
    rem )

    rem for /F "tokens=*" %%m in ('findstr /i /r /c:"[a-z0-9]{32}" %%n') do (
    rem   set mode = 2
    rem )

    rem for /F "tokens=*" %%m in (findstr /i /r /c:"CertUtil:.*"  %%n') do (
    rem   set mode = 3
    rem )

    rem echo %mode%
    rem echo "hello"
  )
)
