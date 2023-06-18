pushd "%~dp0"
pushd ..\tools

.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "audio.cmd" ..\tweaks\audio.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "boot.cmd" ..\tweaks\boot.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "disk.cmd" ..\tweaks\disk.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "gpu.cmd" ..\tweaks\gpu.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "memory.cmd" ..\tweaks\memory.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "network.cmd" ..\tweaks\network.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "peripheral.cmd" ..\tweaks\peripheral.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "power.cmd" ..\tweaks\power.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "processes.cmd" ..\tweaks\processes.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "security.cmd" ..\tweaks\security.cmd
.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c start "usability.cmd" ..\tweaks\usability.cmd

exit