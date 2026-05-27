@echo on
echo Compiling slashem with Microsoft C...
echo.
nmake /f Makefile.MSC
echo Exit code: %ERRORLEVEL%
exit