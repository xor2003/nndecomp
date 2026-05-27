@echo on
echo Compiling MOTF with MSC 6.0 to generate mixed C/assembly listings...
echo.

echo Compiling mots1.c...
d:\bin\cl /c /AM /W1 /Ze /Fc mots1.c
echo Exit code: %ERRORLEVEL%
if exist mots1.cod echo mots1.cod created successfully
if not exist mots1.cod echo mots1.cod NOT created

echo Compiling motfsm.c...
d:\bin\cl /c /AM /W1 /Ze /Fc motfsm.c
echo Exit code: %ERRORLEVEL%
if exist motfsm.cod echo motfsm.cod created successfully
if not exist motfsm.cod echo motfsm.cod NOT created

echo.
echo Final COD files:
dir *.cod
echo.
echo Test completed.
exit