:: Enable previously disabled mitigations
for %%a in (valorant valorant-win64-shipping vgtray vgc faceit faceitclient) do (
    powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable CFG"
    powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable SEHOP"
    powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable DEP"
    powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable EmulateAtlThunks"
)

:: Changes above might be enough. If not, try uncommenting the ones below and reexecuting the script, reboot after.

:: bcdedit /set nx AlwaysOn
:: REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /f
:: REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /f
:: REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v EnableCfg /f
:: REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\kernel" /v DisableExceptionChainValidation /f
:: REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\kernel" /v KernelSEHOPEnabled /f
:: REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationOptions /f
:: REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationAuditOptions /f
:: REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" /v ProtectionMode /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v MoveImages /t REG_DWORD /d 1 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoDataExecutionPrevention /t REG_DWORD /d 0 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v DisableHHDEP /t REG_DWORD /d 0 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v DEPOff /t REG_DWORD /d 0 /f