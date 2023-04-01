echo "Started tweaks processes"

:: ====================================================================================================================================

:: Change split threshold for svchost.exe
for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /value') do set /a mem=%%i + 1024000
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d %mem% /f

:: Optimize priorties to processes
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe" /v UseLargePages /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 3 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v PagePriority /t REG_DWORD /d 1 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QtWebEngineProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QtWebEngineProcess.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QtWebEngineProcess.exe\PerfOptions" /v PagePriority /t REG_DWORD /d 1 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v PagePriority /t REG_DWORD /d 1 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EABackgroundService.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EABackgroundService.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EABackgroundService.exe\PerfOptions" /v PagePriority /t REG_DWORD /d 1 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Battle.net.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Steam.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EpicGamesLauncher.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EADesktop.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 5 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe" /v UseLargePages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe" /v UseLargePages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\starwarsbattlefrontii.exe" /v UseLargePages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bfv.exe" /v UseLargePages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ModernWarfare.exe" /v UseLargePages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe" /v UseLargePages /t REG_DWORD /d 1 /f

:: Pre setup settings to some games
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\Origin Games\STAR WARS Battlefront II\starwarsbattlefrontii.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\Origin Games\Battlefield V\bfv.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\Call of Duty Modern Warfare\ModernWarfare.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\Steam\steamapps\common\Battlefield 2042\BF2042.exe" /t REG_SZ /d "~ HIGHDPIAWARE DISABLEDWM" /f

:: Set system processes that use cycles to low priority
for %%i in (fontdrvhost lsass svchost spoolsv sppsvc WmiPrvSE) do (
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 1 /f >nul 2>&1
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 0 /f >nul 2>&1
)

:: Disable unnecessary autologgers
for %%a in (
    "Circular Kernel Context Logger"
    "CloudExperienceHostOobe"
    "DefenderApiLogger"
    "DefenderAuditLogger"
    "Diagtrack-Listener"
    "LwtNetLog"
    "Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace"
    "NetCore"
    "NtfsLog"
    "RadioMgr"
    "RdrLog"
    "ReadyBoot"
    "SpoolerLogger"
    "UBPM"
    "WiFiSession"
) do (
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\%%~a" /v Start /t REG_DWORD /d 0 /f
)

:: Fix Task Manager not responding when exit
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v Start /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v Start /t REG_DWORD /d 1 /f

:: Kernel tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcWatchdogProfileOffset /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MaximumSharedReadyQueueSize /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DisableAutoBoost /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcTimeout /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v IdealDpcRate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MaximumDpcQueueDepth /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MinimumDpcRate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v ThreadDpcEnable /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v AdjustDpcThreshold /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DpcWatchdogPeriod /t REG_DWORD /d 0 /f
