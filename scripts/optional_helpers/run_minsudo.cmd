pushd "%~dp0"
pushd ..\tools

.\NanaRun\MinSudo --NoLogo --Verbose --System --TrustedInstaller --Privileged cmd /c %1
