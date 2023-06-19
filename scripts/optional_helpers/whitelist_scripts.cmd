pushd "%~dp0"
pushd ..\

powershell 'Add-MpPreference -ExclusionPath "$PSScriptRoot"'
