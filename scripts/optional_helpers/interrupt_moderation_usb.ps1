<#
	WIP (not done)

	I might have disabled a service or it's because I am using Win11 22H2 and the tool are not working, I am unable to run RWEverything to test/check and finish the script.

	-------------------------

	Automated script to disable interrupt moderation / coalesting in all usb controllers

	https://www.overclock.net/threads/usb-polling-precision.1550666/page-61
	https://github.com/djdallmann/GamingPCSetup/tree/master/CONTENT/RESEARCH/PERIPHERALS#universal-serial-bus-usb
	https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md

	It should work with Intel and AMD USB Controllers

	-------------------------

	In case you get problems running the script in Win11, you can run the command to allow, and after, another to set back to a safe or undefined policy

	You can check the current policy settings
	Get-ExecutionPolicy -List

	Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Confirm:$false -Force
	Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser -Confirm:$false -Force

#>

# Start as administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

# Startup command is optional, because before that you must test the script if will work and not cause BSOD, by not having the startup set, a simple restart should be enough to have it normalized.
# If you want to execute startup script, change from $false to $true
$taskName = "InterruptModerationUsb"
$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
if (!$taskExists -And $false) {
    $action = New-ScheduledTaskAction -Execute "powershell" -Argument "-WindowStyle hidden -ExecutionPolicy Bypass -File $PSScriptRoot\interrupt_moderation_usb.ps1"
	$delay = New-TimeSpan -Seconds 10
	$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay $delay
	$principal = New-ScheduledTaskPrincipal -UserID "LOCALSERVICE" -RunLevel Highest
	Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal
	[Environment]::NewLine
}

Write-Host "Started disabling interrupt moderation in all usb controllers"
[Environment]::NewLine

Remove-Item -Path "HKCU:\SOFTWARE\RW-Everything" -Recurse -ErrorAction Ignore

[PsObject[]]$USBControllersAddresses = @()

$allUSBControllers = Get-CimInstance -ClassName Win32_PnPEntity | Where-Object { $_.Name -match 'USB' -and $_.Name -match 'Controller'} | Select-Object -Property Name, DeviceID
foreach ($usbController in $allUSBControllers) {
	$allocatedResource = Get-CimInstance -ClassName Win32_PNPAllocatedResource | Where-Object { $_.Dependent.DeviceID -like "*$($usbController.DeviceID)*" } | Select @{N="StartingAddress";E={$_.Antecedent.StartingAddress}}
	$deviceMemory = Get-CimInstance -ClassName Win32_DeviceMemoryAddress | Where-Object { $_.StartingAddress -eq "$($allocatedResource.StartingAddress)" }
	$USBControllersAddresses += [PsObject]@{
		Name = $usbController.Name
		DeviceId = $usbController.DeviceID
		StartingAddress = $allocatedResource.StartingAddress
		MemoryRange = $deviceMemory.Name
	}
}

foreach ($item in $USBControllersAddresses) {
	$LeftSideMemoryRange = $item.MemoryRange.Split("-")[0]
	..\tools\RW\Rw.exe /Min /NoLogo /Stdout /Command="W16 $LeftSideMemoryRange 0x0000"
	Write-Host "Device: $($item.Name)"
	Write-Host "Device ID: $($item.DeviceId)"
	Write-Host "Starting Address: $($item.StartingAddress)"
	Write-Host "Memory Range: $($item.MemoryRange)"
	[Environment]::NewLine
}

cmd /c pause
