:: Import Nvidia Profile Inspector config
taskkill /f /im "nvcplui.exe" >nul 2>&1
start "" "nvidiaProfileInspector.exe" "low_latency.nip" -silentImport