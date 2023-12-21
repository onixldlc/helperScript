@echo off

set filename=%1
set stickerFolder=C:\Users\%username%\Pictures\stickers\

FOR %%f in (%filename%) do (
  set name=%%~nf
)

magick convert -format gif %filename% %stickerFolder%%name%.gif
exit
