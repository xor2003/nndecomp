@echo on
echo Building all motf targets with Microsoft C 6.0...
echo.

echo Building mots1...
nmake /f mots1_msc.mak
echo mots1 exit code: %ERRORLEVEL%

echo Building motsho...
nmake /f motsho_msc.mak
echo motsho exit code: %ERRORLEVEL%

echo Building tgui1...
nmake /f tgui1_msc.mak
echo tgui1 exit code: %ERRORLEVEL%

echo Building tgui2...
nmake /f tgui2_msc.mak
echo tgui2 exit code: %ERRORLEVEL%

echo Building tgui3...
nmake /f tgui3_msc.mak
echo tgui3 exit code: %ERRORLEVEL%

echo Building mottest...
nmake /f mottest_msc.mak
echo mottest exit code: %ERRORLEVEL%

echo.
echo All builds completed.
echo Checking for COD files...
dir *.cod
exit