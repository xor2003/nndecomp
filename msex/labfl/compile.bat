@echo on
echo Compiling with MSC 6.0 to generate mixed C/assembly listings...
echo.

echo Compiling GRAPHX.C...
d:\bin\cl /c /AS /Fc GRAPHX.C
echo Exit code: %ERRORLEVEL%
if exist GRAPHX.COD echo GRAPHX.COD created successfully
if not exist GRAPHX.COD echo GRAPHX.COD NOT created

echo Compiling SUBS.C...
d:\bin\cl /c /AS /Fc SUBS.C
echo Exit code: %ERRORLEVEL%
if exist SUBS.COD echo SUBS.COD created successfully
if not exist SUBS.COD echo SUBS.COD NOT created

echo Compiling INIT.C...
d:\bin\cl /c /AS /Fc INIT.C
echo Exit code: %ERRORLEVEL%
if exist INIT.COD echo INIT.COD created successfully
if not exist INIT.COD echo INIT.COD NOT created

echo Compiling LAB3D.C...
d:\bin\cl /c /AS /Fc LAB3D.C
echo Exit code: %ERRORLEVEL%
if exist LAB3D.COD echo LAB3D.COD created successfully
if not exist LAB3D.COD echo LAB3D.COD NOT created

echo.
echo Final COD files:
dir *.COD
exit