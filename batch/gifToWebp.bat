@echo off

IF [%1] == [] (set /p filename="Enter FileName: ") else (set filename=%1)
set webpFolder=C:\Users\%username%\Pictures\stickers\webp\

FOR %%f in (%filename%) do (
  set name=%%~nf
)

echo %name%

ffmpeg -i %filename% -vcodec libwebp_anim -lossless 1 -compression_level 6 -loop 0 -preset picture %webpFolder%%name%.webp
