@echo off

set filename=%1
set stickerFolder=C:\Users\%username%\Pictures\stickers\

FOR %%f in (%filename%) do (
  set name=%%~nf
)

ffmpeg -i %filename% -vf palettegen=reserve_transparent=1 custom_transparant_palette_for_convert12873640192471230974.png
ffmpeg -i %filename% -i custom_transparant_palette_for_convert12873640192471230974.png -lavfi paletteuse=alpha_threshold=128 -gifflags -offsetting -r 30 %stickerFolder%%name%.gif
DEL custom_transparant_palette_for_convert12873640192471230974.png
exit
