:: Import Nvidia Profile Inspector config
taskkill /f /im "nvcplui.exe" >nul 2>&1

pushd "%~dp0"
pushd ..\
"tools\nvidiaProfileInspector\nvidiaProfileInspector.exe" "configs\apps\low_latency.nip" -silentImport
