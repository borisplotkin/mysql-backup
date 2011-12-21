@echo off

echo.
echo Downloading: %backupdir%\%backupname% 
echo Host: %h% 
echo Database: %db%
echo.
echo progs\mysqldump -u%usr% -p%pass% -h%h% %db% -) %backupdir%\%backupname%
echo.
progs\mysqldump -u%usr% -p%pass% -h%h% %db% %tbl% > %backupdir%\%backupname%

if not errorlevel 1 goto:eof
echo.
echo Retry in progress...

progs\mysqldump -u%usr% -p%pass% -h%h% %db% %tbl% > %backupdir%\%backupname%

if not errorlevel 1 goto:eof

REM --------- Email message -----------
SET sub="Downloading Backup failed."
SET m="Backup name: %backupname% on Computer: %computername% Host: %h% Database: %db%"
CALL email.bat
