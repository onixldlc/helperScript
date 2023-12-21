@echo off

IF [%1] == [] (set /p filename="Enter FileName: ") else (set filename=%1)
set squareWebpFolder=C:\Users\%username%\Pictures\stickers\squared\

FOR %%f in (%filename%) do (
  set name=%%~nf
)


ffmpeg -i %filename% -vf "scale=256:256:force_original_aspect_ratio=decrease,pad=256:256:(ow-iw)/2:(oh-ih)/2:black@0,setsar=1" -vcodec libwebp_anim -lossless 0 -compression_level 6 -loop 0 %squareWebpFolder%%name%_256x256.webp
