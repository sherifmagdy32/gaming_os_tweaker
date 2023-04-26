echo "Started tweaks memory"

:: ====================================================================================================================================

:: Use big pagefile to improve microstuttering (reboot or system might become unstable and BSoD).
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=32768,MaximumSize=32768

:: (Alternative) Set to zero page file
:: wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
:: wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
:: wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete

:: Disable RAM compression.
powershell Disable-MMAgent -MemoryCompression -PageCombining
powershell Enable-MMAgent -ApplicationPreLaunch

:: =================================================================================================================================

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

:: Disable IOPageLock
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v IoPageLockLimit /t REG_DWORD /d ffffffff /f

:: Free Unused RAM - need testing
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager" /v HeapDeCommitFreeBlockThreshold /t REG_DWORD /d 40000 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v CacheUnmapBehindLengthInMB /t REG_DWORD /d 100 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v ModifiedWriteMaximum /t REG_DWORD /d 20 /f

:: More mem tweaks
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v SystemPages /t REG_DWORD /d ffffffff /f