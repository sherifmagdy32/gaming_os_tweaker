:: DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase /SPSuperseded

:: Nvidia cache cleanup
del /q "%temp%\NVIDIA Corporation\NV_Cache\*"
del /q "%programdata%\NVIDIA Corporation\NV_Cache\*"
for /d %%x in ("%temp%\NVIDIA Corporation\NV_Cache\*") do @rd /s /q "%%x"

:: Fix Windows folder loading problem
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f

:: Windows temp folders cleanup
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q %systemdrive%\Windows\Prefetch\*.*
del /s /f /q %systemdrive%\Windows\Temp\*.*
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*