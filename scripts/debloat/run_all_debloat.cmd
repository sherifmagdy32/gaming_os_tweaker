pushd "%~dp0"
pushd ..\tools

.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "cleanup.cmd" ..\debloat\cleanup.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "features.cmd" ..\debloat\features.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "packages.cmd" ..\debloat\packages.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "tasks.cmd" ..\debloat\tasks.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "remove_edge.cmd" ..\debloat\remove_edge.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "remove_onedrive.cmd" ..\debloat\remove_onedrive.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "services.cmd" ..\debloat\services.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "tasks.cmd" ..\debloat\tasks.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "telemetry.cmd" ..\debloat\telemetry.cmd

:: Optional choice, so no automation
:: .\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "replace_startmenu.cmd" ..\debloat\replace_startmenu.cmd

exit