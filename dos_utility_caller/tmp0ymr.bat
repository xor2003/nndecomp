@echo on
pause
echo 123 > C:\STDOUT.TXT 2> C:\STDERR.TXT
echo %ERRORLEVEL% > C:\EXITCODE.TXT
echo TEST > C:\TEST.TXT
dir C:\*.TXT
pause
