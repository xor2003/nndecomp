@echo off
dir > C:\STDOUT.TXT 2> C:\STDERR.TXT
echo %ERRORLEVEL% > C:\EXITCODE.TXT
echo TEST > C:\TEST.TXT
dir C:\*.TXT
pause
exit
