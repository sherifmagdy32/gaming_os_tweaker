echo "Started tweaks power"

:: Open msinfo32.exe > Hardware Resources > IRQs
SET "GPU_IRQ=4294967218"
SET "USB_IRQ=4294967241"

:: ====================================================================================================================================

:: Unlock Ultimate Performance power scheme and set as active
:: Beware if you re-run the script more than once, it will duplicate the scheme again
for /f "tokens=4" %%I in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do set ultscheme=%%I
powercfg -setactive %ultscheme%

:: Remove Power Save scheme
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

:: Remove Balanced scheme
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e

:: Unlock all power settings options
for /f %%K in ('REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings /s /v "Attributes"^|findstr HKEY_') do REG ADD %%K /v Attributes /t REG_DWORD /d 0 /f

:: Disable usb selective suspend setting
powercfg /setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
:: Processor idle demote threshold
powercfg /setacvalueindex SCHEME_CURRENT 54533251-82BE-4824-96C1-47B60B740D00 4B92D758-5A24-4851-A470-815D78AEE119 100
:: Processor idle promote threshold
powercfg /setacvalueindex SCHEME_CURRENT 54533251-82BE-4824-96C1-47B60B740D00 7B224883-B3CC-4D79-819F-8374152CBE7C 100
:: Link State Power Management
powercfg /setacvalueindex SCHEME_CURRENT 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
:: Set usb 3 link power mangement to maximum performance
powercfg /setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
:: Disable hybrid sleep
powercfg /setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
:: Disable allow wake timers
powercfg /setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
:: Turn off system unattended sleep timeout
powercfg /setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0
:: Disable Standby States
powercfg /setacvalueindex SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 abfc2519-3608-4c2a-94ea-171b0ed546ab 0
:: Disable deep sleep
powercfg /setacvalueindex SCHEME_CURRENT 2e601130-5351-4d9d-8e04-252966bad054 d502f7ee-1dc7-4efd-a55d-f04b6f5c0545 0
:: Processor performance increase threshold
powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 06cadf0e-64ed-448a-8927-ce7bf90eb35d 10
:: Disable throttle states
powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0
:: Latency sensitivity hint processor performance
powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 619b7505-003b-4e82-b7a6-4dd29c300971 100
:: Dim display after
powercfg /setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
:: Turn off display after 0 seconds
powercfg /setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
:: Disable critical battery action
powercfg /setacvalueindex SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 0
:: Disconnected Standby Mode
powercfg /setdcvalueindex SCHEME_CURRENT fea3413e-7e05-4911-9a71-700331f1c294 68afb2d9-ee95-47a8-8f50-4115088073b1 2
:: Turn off hard disk after
powercfg /setdcvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
:: NVMe Power State Transition Latency Tolerance
powercfg /setdcvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 fc95af4d-40e7-4b6d-835a-56d131dbc80e 0
:: Maximum processor state for Processor Power Efficiency Class 1
powercfg /setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ed 100
:: When playing video
powercfg /setdcvalueindex SCHEME_CURRENT 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
:: Processor performance core parking min cores
powercfg /setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100
:: Processor performance core parking core override
powercfg /setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 a55612aa-f624-42c6-a443-7397d064c04f 0
:: Processor performance core parking max cores
powercfg /setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 0
:: Processor performance boost mode
powercfg /setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2
:: Turn off secondary nvme idle timeout
powercfg /setdcvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d3d55efd-c1ff-424e-9dc3-441be7833010 0
:: Turn off primary nvme idle timeout
powercfg /setdcvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d639518a-e56d-4345-8af2-b9f32fb26109 0
:: Turn off nvme noppme
powercfg /setacvalueindex SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 fc7372b6-ab2d-43ee-8797-15e9841f2cca 0
:: Set slide show to paused
powercfg /setacvalueindex SCHEME_CURRENT 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1
:: Disable hub selective suspend timeout
powercfg /setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0
:: Disable critical battery notification
powercfg /setacvalueindex SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 0

:: Seems related to core parking
:: powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 c7be0679-2817-4d69-9d02-519a537ed0c6 0
:: powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6 5
:: powercfg /setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 12a0ab44-fe28-4fa9-b3bd-4b64f44960a7 10

:: Only uncomment if on desktop with good CPU refrigeration and low temps, because it reduces input lag but raises temp even on idle. It keeps running the CPU at 100% all the time.
::powercfg /setacvalueindex SCHEME_CURRENT 54533251-82BE-4824-96C1-47B60B740D00 5D76A2CA-E8C0-402F-A133-2158492D58AD 0

:: Disable Hibernation
powercfg -h off

:: ===============================================================================================================================================================================================

:: Disable HIPM and DIPM
FOR /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
	REG ADD "%%a" /v "EnableHIPM" /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "%%a" /v "EnableDIPM" /t REG_DWORD /d 0 /f >NUL 2>&1
	FOR /F "tokens=*" %%z IN ("%%a") DO (
		SET STR=%%z
		SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\=!
	)
)

:: Disable USB Hub idle
FOR /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v DeviceSelectiveSuspended /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D1Latency /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D2Latency /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\%%a\Device Parameters" /v fid_D3Latency /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D1Latency /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D2Latency /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\usbflags" /v fid_D3Latency /t REG_DWORD /d 0 /f >NUL 2>&1
)

:: Disable power saving feature in devices
for %%a in (
    "EnhancedPowerManagementEnabled"
    "AllowIdleIrpInD3"
    "EnableSelectiveSuspend"
    "DeviceSelectiveSuspended"
    "SelectiveSuspendEnabled"
    "SelectiveSuspendOn"
    "WaitWakeEnabled"
    "D3ColdSupported"
    "WdfDirectedPowerTransitionEnable"
    "EnableIdlePowerManagement"
    "IdleInWorkingState"
) do (
    echo info: configuring %%~a
    for /f "delims=" %%b in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" /s /f "%%~a" ^| findstr "HKEY"') do (
        REG ADD "%%b" /v "%%~a" /t REG_DWORD /d 0 /f > nul 2>&1
    )
)
for %%a in (
    "WakeEnabled"
    "WdkSelectiveSuspendEnable"
) do (
    echo info: configuring %%~a
    for /f "delims=" %%b in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class" /s /f "%%~a" ^| findstr "HKEY"') do (
        REG ADD "%%b" /v "%%~a" /t REG_DWORD /d 0 /f > nul 2>&1
    )
)
for %%a in (
    "DisableIdlePowerManagement"
) do (
	for /f "delims=" %%b in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" /s /f "%%~a" ^| findstr "HKEY"') do (
		REG ADD "%%b" /v "%%~a" /t REG_DWORD /d 1 /f > nul
	)
)

:: Disable disk power savings
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" /s /f "StorPort"^| findstr "StorPort"') do REG ADD "%%i" /v EnableIdlePowerManagement /t REG_DWORD /d 0 /f >nul 2>&1
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do for /f %%a in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f >nul 2>&1
for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
) >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Storage" /v StorageD3InModernStandby /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v IdlePowerMode /t REG_DWORD /d 0 /f

:: Disable Energy Saving feature
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power\ModernSleep" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Power" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\kernel" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Executive" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control" /v CoalescingTimerInterval /t REG_DWORD /d 0 /f

:: Tell Windows to stop tolerating high DPC/ISR latencies.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v ExitLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v ExitLatencyCheckEnabled /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v LatencyToleranceDefault /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v LatencyToleranceFSVP /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v LatencyTolerancePerfOverride /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v LatencyToleranceScreenOffIR /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v LatencyToleranceVSyncEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v RtlCapabilityCheckLatency /t REG_DWORD /d 1 /f

:: Further optimizations to power
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v HibernateEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v EnergyEstimationEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v PerfCalculateActualUtilization /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v SleepReliabilityDetailedDiagnostics /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v EventProcessorEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v QosManagesIdleProcessors /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v DisableVsyncLatencyUpdate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v DisableSensorWatchdog /t REG_DWORD /d 1 /f

:: Disable power throttling
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

:: Disable ASPM
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\pci\Parameters" /v ASPMOptOut /t REG_DWORD /d 1 /f

:: Optimize priorities
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ%GPU_IRQ%Priority /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ%USB_IRQ%Priority /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 36 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ0Priority /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ8Priority /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f

:: Disable Sleep study
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v SleepStudyDisabled /t REG_DWORD /d 1 /f
