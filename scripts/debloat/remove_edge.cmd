taskkill /F /IM msedge.exe  >nul 2>&1

CD %HOMEDRIVE%%HOMEPATH%\Desktop
echo %CD%

echo *** Removing Microsoft Edge ***
call :killdir C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe
call :killdir "C:\Program Files (x86)\Microsoft\Edge"
call :killdir "C:\Program Files (x86)\Microsoft\EdgeUpdate"
call :killdir "C:\Program Files (x86)\Microsoft\EdgeCore"
call :killdir "C:\Program Files (x86)\Microsoft\EdgeWebView"
echo *** Modifying registry ***
call :editreg
echo *** Removing shortcuts ***
call :delshortcut "C:\Users\Public\Desktop\Microsoft Edge.lnk"
call :delshortcut "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
call :delshortcut "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"
echo Finished!
pause
exit

:killdir
echo|set /p=Removing dir %1
if exist %1 (
	takeown /a /r /d Y /f %1 > NUL
	icacls %1 /grant administrators:f /t > NUL
	rd /s /q %1 > NUL
	if exist %1 (
		echo ...Failed.
	) else (
		echo ...Deleted.
	)
) else (
	echo ...does not exist.
)
exit /B 0

:editreg
echo|set /p=Editting registry
echo Windows Registry Editor Version 5.00 > RemoveEdge.reg
echo. >> RemoveEdge.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate] >> RemoveEdge.reg
echo "DoNotUpdateToEdgeWithChromium"=dword:00000001 >> RemoveEdge.reg
echo. >> RemoveEdge.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}] >> RemoveEdge.reg

regedit /s RemoveEdge.reg
del RemoveEdge.reg
echo ...done.
exit /B 0

rmdir /s /q "C:\Program Files (x86)\Microsoft\Edge"
rmdir /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rmdir /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rmdir /s /q "C:\Program Files (x86)\Microsoft\Temp"

for /f "delims=" %%a in ('dir /b "C:\Users"') do (
del /S /Q "C:\Users\%%a\Desktop\edge.lnk" >nul 2>&1
del /S /Q "C:\Users\%%a\Desktop\Microsoft Edge.lnk" >nul 2>&1)


:delshortcut
echo|set /p=Removing shortcut %1
if exist %1 (
	del %1
	echo ...done.
) else (
	echo ...does not exist.
)
exit /B 0