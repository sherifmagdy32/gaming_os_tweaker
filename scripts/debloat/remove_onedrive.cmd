:: ----------------------------------------------------------
:: ------------------Kill OneDrive process-------------------
:: ----------------------------------------------------------
echo --- Kill OneDrive process
taskkill /f /im OneDrive.exe
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Uninstall OneDrive--------------------
:: ----------------------------------------------------------
echo --- Uninstall OneDrive
if %PROCESSOR_ARCHITECTURE%==x86 (
    %SystemRoot%\System32\OneDriveSetup.exe /uninstall 2>nul
) else (
    %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall 2>nul
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove OneDrive leftovers-----------------
:: ----------------------------------------------------------
echo --- Remove OneDrive leftovers
rd "%UserProfile%\OneDrive" /q /s
rd "%LocalAppData%\Microsoft\OneDrive" /q /s
rd "%ProgramData%\Microsoft OneDrive" /q /s
rd "%SystemDrive%\OneDriveTemp" /q /s
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Delete OneDrive shortcuts-----------------
:: ----------------------------------------------------------
echo --- Delete OneDrive shortcuts
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk" /s /f /q
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
del "%USERPROFILE%\Links\OneDrive.lnk" /s /f /q
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable usage of OneDrive-----------------
:: ----------------------------------------------------------
echo --- Disable usage of OneDrive
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSyncNGSC /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSync /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Prevent automatic OneDrive install for current user----
:: ----------------------------------------------------------
echo --- Prevent automatic OneDrive install for current user
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Prevent automatic OneDrive install for new users-----
:: ----------------------------------------------------------
echo --- Prevent automatic OneDrive install for new users
reg load "HKU\Default" "%SystemDrive%\Users\Default\NTUSER.DAT"
REG DELETE "HKU\Default\software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg unload "HKU\Default"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove OneDrive from explorer menu------------
:: ----------------------------------------------------------
echo --- Remove OneDrive from explorer menu
REG DELETE "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG DELETE "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f
REG ADD "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Delete all OneDrive related Services-----------
:: ----------------------------------------------------------
echo --- Delete all OneDrive related Services
for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Delete OneDrive path from registry------------
:: ----------------------------------------------------------
echo --- Delete OneDrive path from registry
REG DELETE "HKCU\Environment" /v OneDrive /f
:: ----------------------------------------------------------
