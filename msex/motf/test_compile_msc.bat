@echo on
echo Compiling mots1 with MSC to generate .COD files...
echo.

echo Cleaning existing files...
del *.obj *.cod *.exe 2>nul
echo.

echo Compiling individual files with MSC to generate .COD files...
echo Compiling mots1.c...
d:\bin\cl /c /AM /W1 /Ze /Fc /I..\..\msc60\INCLUDE mots1.c
if exist mots1.cod echo mots1.cod created successfully
if not exist mots1.cod echo mots1.cod NOT created

echo Compiling motfsm.c...
d:\bin\cl /c /AM /W1 /Ze /Fc /I..\..\msc60\INCLUDE motfsm.c
if exist motfsm.cod echo motfsm.cod created successfully
if not exist motfsm.cod echo motfsm.cod NOT created

echo.
echo Final COD files:
dir *.cod
echo.
echo Build test completed.
exit