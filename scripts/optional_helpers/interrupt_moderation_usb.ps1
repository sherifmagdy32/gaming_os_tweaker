<#
	WIP (not done)

	It should be done for Intel, but not AMD, I dont have any information about it, to know if it's the same address space value and if it's the 24 value to sum with it.

	-------------------------

	Automated script to disable interrupt moderation / coalesting in all usb controllers

	https://www.overclock.net/threads/usb-polling-precision.1550666/page-61
	https://github.com/djdallmann/GamingPCSetup/tree/master/CONTENT/RESEARCH/PERIPHERALS#universal-serial-bus-usb
	https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md
	https://linustechtips.com/topic/1477802-what-does-changing-driver-interrupt-affinity-cause-the-driver-to-do/

	Beware: RW command will not run if you have the GUI version open.

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
$enableApplyStartupScript = $false
$taskName = "InterruptModerationUsb"
$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
if (!$taskExists -And $enableApplyStartupScript) {
  $action = New-ScheduledTaskAction -Execute "powershell" -Argument "-WindowStyle hidden -ExecutionPolicy Bypass -File $PSScriptRoot\interrupt_moderation_usb.ps1"
	$delay = New-TimeSpan -Seconds 10
	$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay $delay
	$principal = New-ScheduledTaskPrincipal -UserID "LOCALSERVICE" -RunLevel Highest
	Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal
	[Environment]::NewLine

	# In case you have to remove the script from startup, but are not able to do from the UI, run:
	# Unregister-ScheduledTask -TaskName "InterruptModerationUsb"
}

Write-Host "Started disabling interrupt moderation in all usb controllers"
[Environment]::NewLine

Remove-Item -Path "HKCU:\SOFTWARE\RW-Everything" -Recurse -ErrorAction Ignore

# REGs improve tools compatibility with Win11 - You might need to reboot to take effect
$BuildNumber = Get-WMIObject Win32_OperatingSystem | Select -ExpandProperty BuildNumber
if ($BuildNumber -ge 22000) {
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Name "Enabled" -Value 0 -Force -Type Dword -ErrorAction Ignore
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" -Name "HypervisorEnforcedCodeIntegrity" -Value 0 -Force -Type Dword -ErrorAction Ignore
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -Force -Type Dword -ErrorAction Ignore
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\SystemGuard" -Name "Enabled" -Value 0 -Force -Type Dword -ErrorAction Ignore
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Config" -Name "VulnerableDriverBlocklistEnable" -Value 0 -Force -Type Dword -ErrorAction Ignore
}

[PsObject[]]$USBControllersAddresses = @()

$allUSBControllers = Get-CimInstance -ClassName Win32_PnPEntity | Where-Object { $_.Name -match 'USB' -and $_.Name -match 'Controller'} | Select-Object -Property Name, DeviceID
foreach ($usbController in $allUSBControllers) {
	$allocatedResource = Get-CimInstance -ClassName Win32_PNPAllocatedResource | Where-Object { $_.Dependent.DeviceID -like "*$($usbController.DeviceID)*" } | Select @{N="StartingAddress";E={$_.Antecedent.StartingAddress}}
	$deviceMemory = Get-CimInstance -ClassName Win32_DeviceMemoryAddress | Where-Object { $_.StartingAddress -eq "$($allocatedResource.StartingAddress)" }

	$deviceProperties = Get-PnpDeviceProperty -InstanceId $usbController.DeviceID
	$locationInfo = $deviceProperties | Where KeyName -eq 'DEVPKEY_Device_LocationInfo' | Select -ExpandProperty Data
	$PDOName = $deviceProperties | Where KeyName -eq 'DEVPKEY_Device_PDOName' | Select -ExpandProperty Data

	$USBControllersAddresses += [PsObject]@{
		Name = $usbController.Name
		DeviceId = $usbController.DeviceID
		MemoryRange = $deviceMemory.Name
		LocationInfo = $locationInfo
		PDOName = $PDOName
	}
}

$tempMemDumpFileName = "TEMP_MEM_DUMP"

# Generate / Dump memory with address values
foreach ($item in $USBControllersAddresses) {
	if ([string]::IsNullOrWhiteSpace($item.MemoryRange)) {
		continue
	}
	$LeftSideMemoryRange = $item.MemoryRange.Split("-")[0]
	$fileName = "$tempMemDumpFileName-$LeftSideMemoryRange"
	..\tools\RW\Rw.exe /Min /NoLogo /Stdout /Stderr /Command="DMEM $LeftSideMemoryRange 32 ..\tools\RW\$fileName" | Out-Null
}

Start-Sleep -Seconds 1

# Process controllers and disable imod
foreach ($item in $USBControllersAddresses) {
	if ([string]::IsNullOrWhiteSpace($item.MemoryRange)) {
		continue
	}
	$LeftSideMemoryRange = $item.MemoryRange.Split("-")[0]
	$fileName = "$tempMemDumpFileName-$LeftSideMemoryRange"

	$Address = ''
	if ($item.Name.Contains('Intel')) {
		$selectedValues = (Get-Content -Path ..\tools\RW\$fileName | Select -Index 3).Split(" ")
		$eighteenDecimalPlus = [int]($selectedValues[4] + $selectedValues[3]) + 24
		$rightSideValue = $eighteenDecimalPlus.ToString().PadLeft(4, '0')
		$leftWithoutLast4Digits = $LeftSideMemoryRange.Substring(0, $LeftSideMemoryRange.length - 4)
		$Address = $leftWithoutLast4Digits + $rightSideValue
	}
	if ($item.Name.Contains('AMD')) {
		# TODO
	}
	if (![string]::IsNullOrWhiteSpace($Address)) {
		..\tools\RW\Rw.exe /Min /NoLogo /Stdout /Stderr /Command="W16 $Address 0x0000"
		Start-Sleep -Seconds 1

		$deviceIdMinInfo = $item.DeviceId.Split("\")[1].Split("&")
		$deviceIdVENValue = $deviceIdMinInfo[0].Split("_")[1]
		$deviceIdDEVValue = $deviceIdMinInfo[1].Split("_")[1]
		$VendorId = "0x" + $deviceIdDEVValue + $deviceIdVENValue

		Write-Host "Device: $($item.Name)"
		Write-Host "Device ID: $($item.DeviceId)"
		Write-Host "Location Info: $($item.LocationInfo)"
		Write-Host "PDO Name: $($item.PDOName)"
		Write-Host "Vendor ID: $VendorId"
		Write-Host "Memory Range: $($item.MemoryRange)"
		Write-Host "Address Used: $Address"
		[Environment]::NewLine
	}
}

# Stop process if not closed and remove temp files
Stop-Process -Name Rw.exe -Force -ErrorAction Ignore
Remove-Item -Path ..\tools\Rw\$tempMemDumpFileName*

cmd /c pause
