pushd "%~dp0"
pushd ..\tools

call ..\optional_helpers\run_minsudo "start "audio.cmd" ..\tweaks\audio.cmd"
call ..\optional_helpers\run_minsudo "start "boot.cmd" ..\tweaks\boot.cmd"
call ..\optional_helpers\run_minsudo "start "disk.cmd" ..\tweaks\disk.cmd"
call ..\optional_helpers\run_minsudo "start "gpu.cmd" ..\tweaks\gpu.cmd"
call ..\optional_helpers\run_minsudo "start "memory.cmd" ..\tweaks\memory.cmd"
call ..\optional_helpers\run_minsudo "start "network.cmd" ..\tweaks\network.cmd"
call ..\optional_helpers\run_minsudo "start "peripheral.cmd" ..\tweaks\peripheral.cmd"
call ..\optional_helpers\run_minsudo "start "power.cmd" ..\tweaks\power.cmd"
call ..\optional_helpers\run_minsudo "start "processes.cmd" ..\tweaks\processes.cmd"
call ..\optional_helpers\run_minsudo "start "security.cmd" ..\tweaks\security.cmd"
call ..\optional_helpers\run_minsudo "start "usability.cmd" ..\tweaks\usability.cmd"

exit