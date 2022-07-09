IF [%1] == [] (set /p url="Enter URL: ") else (set url=%1)
IF [%2] == [] (set /p name="Enter FileName: ") else (set name=%2)
set name=%name%.png
curl %url% -o %name%
start /wait AnimatedPngToGif.bat %name%
DEL %name%
