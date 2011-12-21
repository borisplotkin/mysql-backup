@echo off

if NOT DEFINED backupname pause

echo.
echo Uploding: %backupdir%\%backupname% 
echo Host: %h%
echo Database: %db%
echo.
echo progs\mysql -u%usr% -p%pass% -h%h% %db% (- %backupdir%\%backupname%
echo.
progs\mysql -u%usr% -p%pass% -h%h% %db% < %backupdir%\%backupname%

if not errorlevel 1 goto:eof

REM --- Retry and check for error again ----
echo.
echo Retry in progress...
progs\mysql -u%usr% -p%pass% -h%h% %db% < %backupdir%\%backupname%

if not errorlevel 1 goto:eof

REM --------- Email message -----------
SET sub="Uploading Backup failed."
SET m="Backup name: %backupname% on Computer: %computername% Host: %h% Database: %db%"
CALL email.bat