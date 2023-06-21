pushd "%~dp0"
pushd ..\tools

:: Go at this url https://privacy.sexy/ > Privacy Over Security > Disable Windows Defender (only)
:: Now download the file, rename to (disable_windows_defender)
:: Put in this same folder as this file, and run this file (remove_windows_defender)
:: Wait, once is finish, do a reboot and done

:: You might need to be in safemode, check /optional_helpers/safeboot_toggle.cmd
:: If you go to safemode, run this script and services.cmd from this same folder. Both are required to completely disable/remove windows defender.

call ..\optional_helpers\run_minsudo "start "" ..\debloat\disable_windows_defender.cmd"

exit