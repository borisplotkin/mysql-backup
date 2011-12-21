@echo off

echo.
echo Emailing in 120 seconds...
echo.
sleep 120

if NOT DEFINED m set m="Email test"
if NOT DEFINED sub set sub="Email test subject"

REM ------- ERROR -----
echo. >> logs/errors.txt
echo ----------------------------------- >> logs/errors.txt
echo %sub% %m% >> logs/errors.txt

REM --------From, To and CC-----------
SET f=mainemail@gmail.com
REM SET cc=secondemail@gmail.com

REM ------username/pass-------
SET usr=senfromthisemail
SET pass=password

REM ------other values----------
SET port=587
SET smtp=smtp.gmail.com
SET d=gmail.com
SET v=+bcc +cc -starttls -auth 

echo Emailing To:%f% 
echo Subject: %sub%
echo Message: %m%
echo.
mail -f %f% -d %d% -smtp %smtp% -port %port% -t %f% -sub %sub% -from %f% %v% -user %usr% -pass %pass% -M %m%
pause

REM -cc %cc%