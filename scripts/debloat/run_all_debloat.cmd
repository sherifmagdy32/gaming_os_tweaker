pushd "%~dp0"

start "cleanup.cmd" .\cleanup.cmd"
start "features.cmd" .\features.cmd"
start "packages.cmd" .\packages.cmd"
start "tasks.cmd" .\tasks.cmd"
start "remove_edge.cmd" .\remove_edge.cmd"
start "remove_onedrive.cmd" .\remove_onedrive.cmd"
start "services.cmd" .\services.cmd"
start "tasks.cmd" .\tasks.cmd"
start "telemetry.cmd" .\telemetry.cmd"

:: Optional
:: start "replace_startmenu.cmd" .\replace_startmenu.cmd

exit