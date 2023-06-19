pushd "%~dp0"
pushd ..\tools

call ..\optional_helpers\run_minsudo "start "cleanup.cmd" ..\debloat\cleanup.cmd"
call ..\optional_helpers\run_minsudo "start "features.cmd" ..\debloat\features.cmd"
call ..\optional_helpers\run_minsudo "start "packages.cmd" ..\debloat\packages.cmd"
call ..\optional_helpers\run_minsudo "start "tasks.cmd" ..\debloat\tasks.cmd"
call ..\optional_helpers\run_minsudo "start "remove_edge.cmd" ..\debloat\remove_edge.cmd"
call ..\optional_helpers\run_minsudo "start "remove_onedrive.cmd" ..\debloat\remove_onedrive.cmd"
call ..\optional_helpers\run_minsudo "start "services.cmd" ..\debloat\services.cmd"
call ..\optional_helpers\run_minsudo "start "tasks.cmd" ..\debloat\tasks.cmd"
call ..\optional_helpers\run_minsudo "start "telemetry.cmd" ..\debloat\telemetry.cmd"

:: Optional
:: call ..\optional_helpers\run_minsudo "start "replace_startmenu.cmd" ..\debloat\replace_startmenu.cmd

exit