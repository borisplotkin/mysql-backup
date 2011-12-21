@echo off

REM --------Set dir and filename-------------
SET backupdir=backup-data
SET backupname=backup%date:~4,2%-%date:~7,2%-%date:~10,4%-%random%.sql

CALL db/db1.bat
CALL download.bat

CALL db/db2.bat
CALL upload.bat

CALL db/db3.bat
CALL upload.bat