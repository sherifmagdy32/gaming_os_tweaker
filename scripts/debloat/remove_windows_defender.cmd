pushd "%~dp0"
pushd ..\tools

:: Go at this url https://privacy.sexy/ > Privacy Over Security > Disable Windows Defender (only)
:: Now download the file, rename to (disable_windows_defender)
:: Put in this same folder as this file, and run this file (remove_windows_defender)
:: Wait, once is finish, do a reboot and done

call ..\optional_helpers\run_minsudo "start "" ..\optional_helpers\disable_windows_defender.cmd"
