pushd "%~dp0"

start "audio.cmd" .\audio.cmd
start "boot.cmd" .\boot.cmd
start "disk.cmd" .\disk.cmd
start "gpu.cmd" .\gpu.cmd
start "memory.cmd" .\memory.cmd
start "network.cmd" .\network.cmd
start "peripheral.cmd" .\peripheral.cmd
start "power.cmd" .\power.cmd
start "processes.cmd" .\processes.cmd
start "security.cmd" .\security.cmd
start "usability.cmd" .\usability.cmd

exit