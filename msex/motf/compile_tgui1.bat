@echo on
echo Compiling tgui1 with Microsoft C 6.0...
echo.
nmake /f tgui1_msc.mak
echo Exit code: %ERRORLEVEL%
if exist *.cod echo COD files generated successfully
if not exist *.cod echo No COD files generated
dir *.cod
exit