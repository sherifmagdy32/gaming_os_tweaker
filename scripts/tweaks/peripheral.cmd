:: Forcing RAW Mouse Input and Disabling Enhance Pointer Precision
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 100 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v DoubleClickSpeed /t REG_SZ /d 200 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v SwapMouseButtons /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v RawInput /t REG_SZ /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v SnapToDefaultButton /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseDelay /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v ActiveWindowTracking /t REG_DWORD /d 0 /f

REG DELETE "HKEY_CURRENT_USER\Control Panel\Mouse" /v SmoothMouseXCurve /f
REG DELETE "HKEY_CURRENT_USER\Control Panel\Mouse" /v SmoothMouseYCurve /f
:: Changes from MarkC Mouse Accel Fixes. Might not be needed. Uncomment if you want. It's for 100% scale.
:: REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v SmoothMouseXCurve /t REG_BINARY /d 0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000 /f
:: REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v SmoothMouseYCurve /t REG_BINARY /d 0000000000000000000038000000000000007000000000000000A800000000000000E00000000000 /f

for /f "delims=" %%b in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" ^| findstr "^Device Parameters$"') do (
	REG ADD "%%b" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f > nul 2>&1
)

:: Keyboard tweaks
REG ADD "HKEY_CURRENT_USER\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 0 /f

:: Mouse Cursor Tweaks
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v AttractionRectInsetInDIPS /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v DistanceThresholdInDIPS /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismDelayInMilliseconds /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismUpdateIntervalInMilliseconds /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v VelocityInDIPSPerSecond /t REG_DWORD /d 0 /f

:: Tweak mouse and keyboard queue buffer size
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 40 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 40 /f

:: Optimize mouse and keyboard settings
:: Flags 122 disable filterkeys, but it is what is necessary to bypass certain limits from windows, so 27. As to keep everything else disabled too.
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 27 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v BounceTime /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v KeyboardDelay /t REG_DWORD /d 0 /f
:: Tweak these 2 values below to find your right ones
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t REG_SZ /d 180 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t REG_SZ /d 2 /f

:: Disable typing insights
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v InsightsEnabled /t REG_DWORD /d 0 /f

:: Disable USB selective suspend
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB" /v DisableSelectiveSuspend /t REG_DWORD /d 1 /f

:: Disable Touch Input
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Wisp\Touch" /v TouchGate /t REG_DWORD /d 0 /f

:: Control Panel Tweaks
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v Beep /t REG_SZ /d "No" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v ExtendedSounds /t REG_SZ /d "No" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Sound" /v Beep /t REG_SZ /d "no" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Sound" /v ExtendedSounds /t REG_SZ /d "no" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v MouseWheelRouting /t REG_DWORD /d 0 /f

:: Mouse Cursor faster refresh
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 2710 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorUpdateInterval /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v IRRemoteNavigationDelta /t REG_DWORD /d 1 /f

:: Disable hardware buttons as valid keys
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Buttons" /v HardwareButtonsAsVKeys /t REG_DWORD /d 0 /f

:: Dwm tweaks
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v DesktopHeapLogging /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v DwmInputUsesIoCompletionPort /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v EnableDwmInputProcessing /t REG_DWORD /d 0 /f

:: Increase explorer responses
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsolutePointerAsAbsolute /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsoluteAsRelative /t REG_DWORD /d 0 /f

:: Disable devices power saving
powershell "$devices = Get-WmiObject Win32_PnPEntity; $powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; foreach ($p in $powerMgmt){$IN = $p.InstanceName.ToUpper(); foreach ($h in $devices){$PNPDI = $h.PNPDeviceID; if ($IN -like \"*$PNPDI*\"){$p.enable = $False; $p.psbase.put()}}}"

:: Disable USB Hub idle
for /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
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

:: Disable power saving pnp
powershell -noprofile -executionpolicy bypass -c "$power_device_enable = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; $usb_devices = @(\"Win32_USBController\", \"Win32_USBControllerDevice\", \"Win32_USBHub\"); foreach ($power_device in $power_device_enable) { $instance_name = $power_device.InstanceName.ToUpper(); foreach ($device in $usb_devices) { foreach ($hub in Get-WmiObject $device) { $pnp_id = $hub.PNPDeviceID; if ($instance_name -like \"*$pnp_id*\") { $power_device.enable = $False; $power_device.psbase.put(); }}}}"

:: Disable Power saving from USB
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters\Wdf" /v NoExtraBufferRoom /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v AllowIdleIrpInD3 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 0 /f
for /L %%V in (0,1,32) do (
    if %%V LSS 10 ( REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\000%%V" /v IdleEnable /t REG_DWORD /d 0 /f )
    else ( REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Class\USB\00%%V" /v IdleEnable /t REG_DWORD /d 0 /f )
)
