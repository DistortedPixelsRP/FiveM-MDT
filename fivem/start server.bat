@echo off
TITLE Auto Restarter

rem ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rem CONFIG

rem Change to location of run.cmd
set locationOne=C:\fxserver2

rem Change to location of server.cfg
set locationTwo=C:\fxserver2\cfx-server-data-master

rem Change to server id number. Can be whatever number you want. Make sure it's a different number than any other FiveM server running on this computer
set serverID=1



rem ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rem Code:


echo Server starting! [%date%  %time%]
:start
Cd %locationTwo%
rem start %locationOne%\run.cmd +exec server.cfg +/k "TITLE joMAMA"
start "Server %serverID%" %locationOne%\run.cmd +exec server.cfg
goto loop


:loop
timeout /t 5 /nobreak > NUL
if exist %locationTwo%\restart.file (
	echo Server is restarting! [%date%  %time%]
	del "%locationTwo%\restart.file"
	
	for /f "tokens=2 delims=," %%a in ('
    tasklist /fi "imagename eq cmd.exe" /v /fo:csv /nh 
    ^| findstr /r /c:".*Server %serverID%[^,]*$"
	') do taskkill /pid %%a
	
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