@echo off
echo:
for %%x in (%*) do (
  for /F "tokens=*" %%n in ('certutil -hashfile "%%~x" SHA512') do (
    set out = %%n
    echo %%n | >nul findstr /i /r /c:"^SHA512 hash of.*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^[abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890].*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^CertUtil:.*" && ( echo: )
  )
)
