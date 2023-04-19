echo "Started debloat telemetry"

:: ====================================================================================================================================

:: Remove Metadata Tracking
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f

:: Disable Nvidia Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v Start /t REG_DWORD /d 4 /f
for %%i in (NvTmMon NvTmRep NvProfile) do for /f "tokens=1 delims=," %%a in ('schtasks /query /fo csv^| findstr /v "TaskName"^| findstr "%%~i"') do schtasks /change /tn "%%a" /disable >nul 2>&1

:: Enforce Security-Only Telemetry (disable other kinds of Telemetry)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable Application Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f

:: Disable inking and typing recognition data sending
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f

:: Disable app usage tracking
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableMFUTracking /t REG_DWORD /d 1 /f

:: Disable more data collection on explorer
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f

:: Disable more error reports
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v NoActiveHelp /t REG_DWORD /d 1 /f

:: Disable crash telemetry
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry" /v DeviceDumpEnabled /t REG_DWORD /d 0 /f

:: Disable telemetry collector
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f

:: ====================================================================================================================================

:: IP Block
set hostspath=%windir%\System32\drivers\etc\hosts

echo 127.0.0.1 vortex.data.microsoft.com >> %hostspath%
echo 127.0.0.1 vortex-win.data.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 redir.metaservices.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 services.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.ppe.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net >> %hostspath%
echo 127.0.0.1 telemetry.urs.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net:443 >> %hostspath%
echo 127.0.0.1 vortex-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 settings-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 vortex.data.microsoft.com >> %hostspath%
echo 127.0.0.1 vortex-win.data.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 redir.metaservices.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 vortex-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 settings-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.ppe.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net >> %hostspath%
echo 127.0.0.1 telemetry.urs.microsoft.com >> %hostspath%
echo 127.0.0.1 survey.watson.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.live.com >> %hostspath%
echo 127.0.0.1 services.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net >> %hostspath%
echo 127.0.0.1 vortex.data.microsoft.com >> %hostspath%
echo 127.0.0.1 vortex-win.data.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 redir.metaservices.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com >> %hostspath%
echo 127.0.0.1 choice.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 services.wes.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 sqm.df.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.ppe.telemetry.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net >> %hostspath%
echo 127.0.0.1 telemetry.urs.microsoft.com >> %hostspath%
echo 127.0.0.1 telemetry.appex.bing.net:443 >> %hostspath%
echo 127.0.0.1 settings-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 vortex-sandbox.data.microsoft.com >> %hostspath%
echo 127.0.0.1 survey.watson.microsoft.com >> %hostspath%
echo 127.0.0.1 watson.live.com >> %hostspath%
echo 127.0.0.1 watson.microsoft.com >> %hostspath%
echo 127.0.0.1 statsfe2.ws.microsoft.com >> %hostspath%
echo 127.0.0.1 corpext.msitadfs.glbdns2.microsoft.com >> %hostspath%
echo 127.0.0.1 compatexchange.cloudapp.net >> %hostspath%
echo 127.0.0.1 cs1.wpc.v0cdn.net >> %hostspath%
echo 127.0.0.1 a-0001.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0002.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0003.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0004.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0005.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0006.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0007.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0008.a-msedge.net >> %hostspath%
echo 127.0.0.1 a-0009.a-msedge.net >> %hostspath%
echo 127.0.0.1 msedge.net >> %hostspath%
echo 127.0.0.1 a-msedge.net >> %hostspath%
echo 127.0.0.1 statsfe2.update.microsoft.com.akadns.net >> %hostspath%
echo 127.0.0.1 sls.update.microsoft.com.akadns.net >> %hostspath%
echo 127.0.0.1 fe2.update.microsoft.com.akadns.net >> %hostspath%
echo 127.0.0.1 diagnostics.support.microsoft.com >> %hostspath%
echo 127.0.0.1 corp.sts.microsoft.com >> %hostspath%
echo 127.0.0.1 statsfe1.ws.microsoft.com >> %hostspath%
echo 127.0.0.1 pre.footprintpredict.com >> %hostspath%
echo 127.0.0.1 i1.services.social.microsoft.com >> %hostspath%
echo 127.0.0.1 i1.services.social.microsoft.com.nsatc.net >> %hostspath%
echo 127.0.0.1 feedback.windows.com >> %hostspath%
echo 127.0.0.1 feedback.microsoft-hohm.com >> %hostspath%
echo 127.0.0.1 feedback.search.microsoft.com >> %hostspath%
echo 127.0.0.1 live.rads.msn.com >> %hostspath%
echo 127.0.0.1 ads1.msn.com >> %hostspath%
echo 127.0.0.1 static.2mdn.net >> %hostspath%
echo 127.0.0.1 g.msn.com >> %hostspath%
echo 127.0.0.1 a.ads2.msads.net >> %hostspath%
echo 127.0.0.1 b.ads2.msads.net >> %hostspath%
echo 127.0.0.1 ad.doubleclick.net >> %hostspath%
echo 127.0.0.1 ac3.msn.com >> %hostspath%
echo 127.0.0.1 rad.msn.com >> %hostspath%
echo 127.0.0.1 msntest.serving-sys.com >> %hostspath%
echo 127.0.0.1 bs.serving-sys.com1 >> %hostspath%
echo 127.0.0.1 flex.msn.com >> %hostspath%
echo 127.0.0.1 ec.atdmt.com >> %hostspath%
echo 127.0.0.1 cdn.atdmt.com >> %hostspath%
echo 127.0.0.1 db3aqu.atdmt.com >> %hostspath%
echo 127.0.0.1 cds26.ams9.msecn.net >> %hostspath%
echo 127.0.0.1 sO.2mdn.net >> %hostspath%
echo 127.0.0.1 aka-cdn-ns.adtech.de >> %hostspath%
echo 127.0.0.1 secure.flashtalking.com >> %hostspath%
echo 127.0.0.1 adnexus.net >> %hostspath%
echo 127.0.0.1 adnxs.com >> %hostspath%
echo 127.0.0.1 *.rad.msn.com >> %hostspath%
echo 127.0.0.1 *.msads.net >> %hostspath%
echo 127.0.0.1 *.msecn.net >> %hostspath%
