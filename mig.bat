
@ECHO OFF
title Mig PHP v1.0

set def=1112
set p1=Mininova Web Service v1.0
set sdir=%~dp0


echo."    mig php: fast, light-weight php server            "
echo."        author: alikhaniaryan@live.com                "
echo."        __  __ _       _ _   _                        "
echo."       |  \/  (_)     (_) \ | |                       "
echo."       | \  / |_ _ __  _|  \| | _____   ____ _        "
echo."       | |\/| | | '_ \| | . ` |/ _ \ \ / / _` |       "
echo."       | |  | | | | | | | |\  | (_) \ V / (_| |       "
echo."       |_|  |_|_|_| |_|_|_| \_|\___/ \_/ \__,_|       "
echo."                      mininovagroup                   "
echo."                                                      "
echo."                                                      "

if "%1" == "." GOTO:menu_OP
if "%1" == "i" GOTO:menu_I
if "%1" == "u" GOTO:menu_U
if "%1" == "s" GOTO:menu_1
if "%1" == "t" GOTO:menu_2
if "%1" == "r" GOTO:menu_3

GOTO:eof

:menu_I

set mdir=%sdir%\%default

if "%prt%" == "" set prt=%def%

for /f "tokens=1,2,3,4,5,6,7,8,9 delims=\" %%a in ("%sdir%") do (
  set t1=%%a
  set t2=%%b
  set t3=%%c
  set t4=%%d
  set t5=%%e
  set t6=%%f
  set t7=%%g
  set t8=%%h
  set t9=%%i
) 
set col=%t1%
if not "%t2%" == "" set col=%col%/%t2%
if not "%t3%" == "" set col=%col%/%t3%
if not "%t4%" == "" set col=%col%/%t4%
if not "%t5%" == "" set col=%col%/%t5%
if not "%t6%" == "" set col=%col%/%t6%
if not "%t7%" == "" set col=%col%/%t7%
if not "%t8%" == "" set col=%col%/%t8%
if not "%t9%" == "" set col=%col%/%t9%

for /f "tokens=1,2,3,4,5,6,7,8,9 delims=\" %%a in ("%mdir%") do (
  set t1=%%a
  set t2=%%b
  set t3=%%c
  set t4=%%d
  set t5=%%e
  set t6=%%f
  set t7=%%g
  set t8=%%h
  set t9=%%i
) 
set col2=%t1%
if not "%t2%" == "" set col2=%col2%/%t2%
if not "%t3%" == "" set col2=%col2%/%t3%
if not "%t4%" == "" set col2=%col2%/%t4%
if not "%t5%" == "" set col2=%col2%/%t5%
if not "%t6%" == "" set col2=%col2%/%t6%
if not "%t7%" == "" set col2=%col2%/%t7%
if not "%t8%" == "" set col2=%col2%/%t8%
if not "%t9%" == "" set col2=%col2%/%t9%

del "%sdir%\apache\conf\httpd.conf"
xcopy /r /e /y /q "%sdir%\config" "%sdir%\apache\conf"

echo.  >> %sdir%\apache\conf\httpd.conf
echo.Listen %prt%>> %sdir%\apache\conf\httpd.conf
echo.ServerRoot "%col%/apache" >> %sdir%\apache\conf\httpd.conf
echo.ScriptAlias /php/ "%col%/php/" >> %sdir%\apache\conf\httpd.conf
echo.DocumentRoot "%col2%" >> %sdir%\apache\conf\httpd.conf

echo.AddType application/x-httpd-php .php >>%sdir%\apache\conf\httpd.conf
echo.AddType application/x-httpd-php .phtml >>%sdir%\apache\conf\httpd.conf
echo.Action application/x-httpd-php "/php/php-cgi.exe" >>%sdir%\apache\conf\httpd.conf

echo.^<IfModule dir_module^> >> %sdir%\apache\conf\httpd.conf
echo.    DirectoryIndex index.php index.html >>%sdir%\apache\conf\httpd.conf 
echo.^</IfModule^> >>%sdir%\apache\conf\httpd.conf

echo.^<Directory "%col2%"^> >>%sdir%\apache\conf\httpd.conf
echo.    Options Indexes FollowSymLinks >>%sdir%\apache\conf\httpd.conf
echo.    AllowOverride None >>%sdir%\apache\conf\httpd.conf
echo.    Order allow,deny >>%sdir%\apache\conf\httpd.conf
echo.    Allow from all >>%sdir%\apache\conf\httpd.conf
echo.^</Directory^> >>%sdir%\apache\conf\httpd.conf

echo.^<Directory "%col%/php"^> >>%sdir%\apache\conf\httpd.conf
echo.    AllowOverride None >>%sdir%\apache\conf\httpd.conf
echo.    Options None >>%sdir%\apache\conf\httpd.conf
echo.    Order allow,deny >>%sdir%\apache\conf\httpd.conf
echo.    Allow from all >>%sdir%\apache\conf\httpd.conf
echo.^</Directory^> >>%sdir%\apache\conf\httpd.conf

call "%sdir%\apache\bin\httpd.exe" -k install -n "%p1%" -f "%sdir%\apache\conf\httpd.conf"
echo.
echo.
echo.Running %col2% 
echo.http://localhost:%prt%/
echo.
echo.


GOTO:eof

:menu_OP
set mdir=%cd%
set /p prt=Enter Server Port(%def% is default):
if "%prt%" == "" set prt=%def%

for /f "tokens=1,2,3,4,5,6,7,8,9 delims=\" %%a in ("%sdir%") do (
  set t1=%%a
  set t2=%%b
  set t3=%%c
  set t4=%%d
  set t5=%%e
  set t6=%%f
  set t7=%%g
  set t8=%%h
  set t9=%%i
) 
set col=%t1%
if not "%t2%" == "" set col=%col%/%t2%
if not "%t3%" == "" set col=%col%/%t3%
if not "%t4%" == "" set col=%col%/%t4%
if not "%t5%" == "" set col=%col%/%t5%
if not "%t6%" == "" set col=%col%/%t6%
if not "%t7%" == "" set col=%col%/%t7%
if not "%t8%" == "" set col=%col%/%t8%
if not "%t9%" == "" set col=%col%/%t9%

for /f "tokens=1,2,3,4,5,6,7,8,9 delims=\" %%a in ("%mdir%") do (
  set t1=%%a
  set t2=%%b
  set t3=%%c
  set t4=%%d
  set t5=%%e
  set t6=%%f
  set t7=%%g
  set t8=%%h
  set t9=%%i
) 
set col2=%t1%
if not "%t2%" == "" set col2=%col2%/%t2%
if not "%t3%" == "" set col2=%col2%/%t3%
if not "%t4%" == "" set col2=%col2%/%t4%
if not "%t5%" == "" set col2=%col2%/%t5%
if not "%t6%" == "" set col2=%col2%/%t6%
if not "%t7%" == "" set col2=%col2%/%t7%
if not "%t8%" == "" set col2=%col2%/%t8%
if not "%t9%" == "" set col2=%col2%/%t9%

del "%sdir%\apache\conf\httpd.conf"
xcopy /r /e /y /q "%sdir%\config" "%sdir%\apache\conf"

echo.  >> %sdir%\apache\conf\httpd.conf
echo.Listen %prt%>> %sdir%\apache\conf\httpd.conf
echo.ServerRoot "%col%/apache" >> %sdir%\apache\conf\httpd.conf
echo.ScriptAlias /php/ "%col%/php/" >> %sdir%\apache\conf\httpd.conf
echo.DocumentRoot "%col2%" >> %sdir%\apache\conf\httpd.conf

echo.AddType application/x-httpd-php .php >>%sdir%\apache\conf\httpd.conf
echo.AddType application/x-httpd-php .phtml >>%sdir%\apache\conf\httpd.conf
echo.Action application/x-httpd-php "/php/php-cgi.exe" >>%sdir%\apache\conf\httpd.conf

echo.^<IfModule dir_module^> >> %sdir%\apache\conf\httpd.conf
echo.    DirectoryIndex index.php index.html >>%sdir%\apache\conf\httpd.conf 
echo.^</IfModule^> >>%sdir%\apache\conf\httpd.conf

echo.^<Directory "%col2%"^> >>%sdir%\apache\conf\httpd.conf
echo.    Options Indexes FollowSymLinks >>%sdir%\apache\conf\httpd.conf
echo.    AllowOverride None >>%sdir%\apache\conf\httpd.conf
echo.    Order allow,deny >>%sdir%\apache\conf\httpd.conf
echo.    Allow from all >>%sdir%\apache\conf\httpd.conf
echo.^</Directory^> >>%sdir%\apache\conf\httpd.conf

echo.^<Directory "%col%/php"^> >>%sdir%\apache\conf\httpd.conf
echo.    AllowOverride None >>%sdir%\apache\conf\httpd.conf
echo.    Options None >>%sdir%\apache\conf\httpd.conf
echo.    Order allow,deny >>%sdir%\apache\conf\httpd.conf
echo.    Allow from all >>%sdir%\apache\conf\httpd.conf
echo.^</Directory^> >>%sdir%\apache\conf\httpd.conf

call "%sdir%\apache\bin\httpd.exe" -k restart -n "%p1%"
echo.
echo.
echo.Running %col2% 
echo.http://localhost:%prt%/
echo.
echo.

GOTO:eof

:menu_U
call "%sdir%\apache\bin\httpd.exe" -k shutdown -n "%p1%"
call "%sdir%\apache\bin\httpd.exe" -k uninstall -n "%p1%"
GOTO:EOF

:menu_
:menu_1
call "%sdir%\apache\bin\httpd.exe" -k start -n "%p1%"
GOTO:EOF

:menu_2
call "%sdir%\apache\bin\httpd.exe" -k shutdown -n "%p1%"
GOTO:EOF

:menu_3
call "%sdir%\apache\bin\httpd.exe" -k restart -n "%p1%"
GOTO:EOF