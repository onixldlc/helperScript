@echo off
echo:
for %%x in (%*) do (
  for /F "tokens=*" %%n in ('certutil -hashfile "%%~x" SHA512') do (
    set out = %%n
    echo %%n | >nul findstr /i /r /c:"^SHA512 hash of.*" && ( echo hashes of %%x: )
    echo %%n | >nul findstr /i /r /c:"^[abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890].*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^CertUtil:.*" && (set out = 1)
  )
  for /F "tokens=*" %%n in ('certutil -hashfile "%%~x" SHA256') do (
    set out = %%n
    echo %%n | >nul findstr /i /r /c:"^SHA256 hash of.*" && (set out = 1)
    echo %%n | >nul findstr /i /r /c:"^[abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890].*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^CertUtil:.*" && (set out = 1)
  )
  for /F "tokens=*" %%n in ('certutil -hashfile "%%~x" MD5') do (
    set out = %%n
    echo %%n | >nul findstr /i /r /c:"^MD5 hash of.*" && (set out = 1)
    echo %%n | >nul findstr /i /r /c:"^[abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890][abcdef1234567890].*" && ( echo %%n )
    echo %%n | >nul findstr /i /r /c:"^CertUtil:.*" && ( echo: )
  )
)
