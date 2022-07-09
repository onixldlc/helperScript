set name=%2.png
curl %1 -o %name%
start /wait AnimatedPngToGif.bat %name%
DEL %name%
