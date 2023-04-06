:: Import Nvidia Profile Inspector config
taskkill /f /im "nvcplui.exe" >nul 2>&1

pushd "%~dp0"
pushd ..\additional_files
"nvidiaProfileInspector\nvidiaProfileInspector.exe" "low_latency.nip" -silentImport
