set filename=%1
set name=%filename:.png=%
ffmpeg -i %filename% -vf palettegen=reserve_transparent=1 custom_transparant_palette_for_convert12873640192471230974.png
ffmpeg -i %filename% -i custom_transparant_palette_for_convert12873640192471230974.png -lavfi paletteuse=alpha_threshold=128 -gifflags -offsetting -r 30 %name%.gif
DEL custom_transparant_palette_for_convert12873640192471230974.png
