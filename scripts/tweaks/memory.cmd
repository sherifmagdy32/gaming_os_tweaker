echo "Started tweaks memory"

:: ====================================================================================================================================

:: Use big pagefile to improve microstuttering (reboot or system might become unstable and BSoD).
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=32768,MaximumSize=32768

:: Disable RAM compression.
powershell Disable-MMAgent -MemoryCompression -PageCombining
powershell Enable-MMAgent -ApplicationPreLaunch

:: =================================================================================================================================

:: Enable Kernel-Managed Memory and disable Meltdown/Spectre patches.
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f

:: Disallow drivers to get paged into virtual memory.
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f

:: Use big system memory caching to improve microstuttering.
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f

:: Disable fetch feature that may cause higher disk usage.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableBoottrace /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v SfTracingState /t REG_DWORD /d 0 /f

:: Disable FTH (Fault Tolerant Heap)
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\FTH" /v Enabled /t REG_DWORD /d 0 /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\FTH\State" /f

:: Disable PageCombining
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePageCombining /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingCombining /t REG_DWORD /d 1 /f
