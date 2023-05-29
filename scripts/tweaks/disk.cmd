:: Improve NTFS performance
fsutil behavior set disabledeletenotify 0
fsutil behavior set disabledeletenotify refs 0
fsutil behavior set mftzone 2
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
fsutil behavior set memoryusage 2
fsutil behavior set disable8dot3 1

:: Keep both set to 0, otherwise it will break restore system point.
fsutil behavior set disablecompression 0
fsutil behavior set disableencryption 0

:: ===============================================================================================================================================================

:: Disable IoLatencyCap
for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
	REG ADD "%%a" /v IoLatencyCap /t REG_DWORD /d "0" /f >NUL 2>&1
	for /F "tokens=*" %%z IN ("%%a") DO (
		SET STR=%%z
		SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
		SET STR=!STR:\Parameters=!
	)
)

:: Disable StorPort idle
for /F "tokens=*" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
	REG ADD "%%a" /v EnableIdlePowerManagement /t REG_DWORD /d "0" /f >NUL 2>&1
	for /F "tokens=*" %%z IN ("%%a") DO (
		SET STR=%%z
		SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\=!
		SET STR=!STR:\Device Parameters\StorPort=!
	)
)

:: Disable disk power savings
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do for /f %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f >nul 2>&1
for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
) >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Storage" /v StorageD3InModernStandby /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v IdlePowerMode /t REG_DWORD /d 0 /f

:: Disable disk defrag
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v Enable /t REG_SZ /d N /f

:: Disable persistent timestamp refresh
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v TimeStampInterval /t REG_DWORD /d 0 /f

:: File System tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v DisableDeleteNotification /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsAllowExtendedCharacter8dot3Rename /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsBugcheckOnCorrupt /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableCompression /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableEncryption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsEncryptPagingFile /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMftZoneReservation /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v RefsDisableLastAccessUpdate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v UdfsSoftwareDefectManagement /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v Win31FileSystem /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v FileNameCache /t REG_DWORD /d 1024 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v PathCache /t REG_DWORD /d 128 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v ContigFileAllocSize /t REG_DWORD /d 1536 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v DontVerifyRandomDrivers /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v FilterSupportedFeaturesMode /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NTFSDisableLastAccessUpdate /t REG_DWORD /d 80000001 /f

:: Disable HIPM and DIPM
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0HIPM /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0DIPM /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1HIPM /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1DIPM /t REG_DWORD /d 0 /f
for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
	REG ADD "%%a" /v EnableHIPM /t REG_DWORD /d 0 /f >NUL 2>&1
	REG ADD "%%a" /v EnableDIPM /t REG_DWORD /d 0 /f >NUL 2>&1
	for /F "tokens=*" %%z IN ("%%a") DO (
		SET STR=%%z
		SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\=!
	)
)