echo "Started debloat cleanup"

:: ====================================================================================================================================

DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase /SPSuperseded

:: Nvidia cache cleanup
del /q "%temp%\NVIDIA Corporation\NV_Cache\*"
del /q "%programdata%\NVIDIA Corporation\NV_Cache\*"
for /d %%x in ("%temp%\NVIDIA Corporation\NV_Cache\*") do @rd /s /q "%%x"