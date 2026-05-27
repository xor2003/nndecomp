@echo on
echo Building all slashem targets with Microsoft C...
echo.

echo Building slashem...
nmake /f Makefile.MSC
echo slashem exit code: %ERRORLEVEL%

echo.
echo All builds completed.
exit