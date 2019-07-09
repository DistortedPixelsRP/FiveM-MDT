@echo off
TITLE Auto Restarter

rem ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rem CONFIG

rem change to location of run.cmd
set locationOne=C:\fxserver

rem change to location of server.cfg
set locationTwo=C:\fxserver\cfx-server-data-master



rem ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rem Code:


echo Server starting! [%date%  %time%]
:start
Cd %locationTwo%
start %locationOne%\run.cmd +exec server.cfg
goto loop


:loop
timeout /t 5 /nobreak > NUL
if exist %locationTwo%\restart.file (
	echo Server is restarting! [%date%  %time%]
	del "%locationTwo%\restart.file"
	taskkill /IM cmd.exe /FI "WINDOWTITLE ne Auto Restarter*"
	goto start
) else (
	
	TASKLIST | FINDSTR /I "FXServer.exe" > NUL
	IF ERRORLEVEL 1 (
	echo Server has shutdown unexpectedly... restarting! [%date%  %time%]
	goto start
	) ELSE (
	goto loop
	)
)

pause