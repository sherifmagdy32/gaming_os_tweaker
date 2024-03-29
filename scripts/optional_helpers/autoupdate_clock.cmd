:: Useful if you have a machine with dual boot Windows + Linux, and the clock gets messed up, regardless if you set local time. Or in case it's broken and not keeping up the correct time after disabling the service.
powershell -c "$action = New-ScheduledTaskAction -Execute \"powershell\" -Argument \"-WindowStyle hidden -Command net start w32time; w32tm /resync; net stop w32time;\"; $delay = New-TimeSpan -Seconds 10; $trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay $delay; $principal = New-ScheduledTaskPrincipal -UserID $env:USERNAME -RunLevel Highest; Register-ScheduledTask -TaskName \"AutoUpdateClock\" -Action $action -Trigger $trigger -Principal $principal;"

:: In case you dont have internet connection and sync would not work, you can get the timezone, and set it.
:: powershell -c "Get-TimeZone -ListAvailable"
:: powershell -c 'Set-Timezone -Id "E. South America Standard Time"'