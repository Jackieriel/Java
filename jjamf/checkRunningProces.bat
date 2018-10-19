@echo off
:infinite
java FileReadAttribute
tasklist /FI "IMAGENAME eq winword.exe" 2>NUL | find /I /N "winword.exe">NUL
if "%ERRORLEVEL%"=="0" goto running 
tasklist /FI "IMAGENAME eq powerpnt.exe" 2>NUL | find /I /N "powerpnt.exe">NUL
if "%ERRORLEVEL%"=="0" goto running
tasklist /FI "IMAGENAME eq excel.exe" 2>NUL | find /I /N "excel.exe">NUL
if "%ERRORLEVEL%"=="0" goto running 
tasklist /FI "IMAGENAME eq msaccess.exe" 2>NUL | find /I /N "msaccess.exe">NUL
if "%ERRORLEVEL%"=="0" goto running 
if "%ERRORLEVEL%"=="1" goto notrunning

:running 
tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find /I /N "java.exe">NUL
if "%ERRORLEVEL%"=="0" goto commonexit
if "%ERRORLEVEL%"=="1" start visualMessage.lnk
goto commonexit

:notrunning
Taskkill /IM java.exe /F 2>NUL

:commonexit
goto infinite

