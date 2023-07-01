<#
	WIP (not done)

	Actual IMOD disabling are temporarily disabled, the script are WIP, we are trying to figure out how to solve the last step that is a possible problem.

	Discussion happening at https://github.com/djdallmann/GamingPCSetup/issues/12

	You can provide feedback for what is being discussed. If you want, and even a solution if you know how.

	1- For Win7, Win10 there are different values to differentiate between what is a correct IMOD address, I need to know that the script are currently grabbing the correct address given your OS. I dont know the values for Win11, if they are like Win10 or not. So for now, only matters Win7 and Win10, unless you are deeply knowledge of the subject and know about Win11. Reference at https://www.overclock.net/threads/usb-polling-precision.1550666/page-61#post-28580928

	2- The last problem that I was looking to solve is, devices have different interrupters amount, I cannot set a static value expecting it to be correct, a solution is needed for the problem, and two things could solve the problem. We need a way to get/identify the information we need, from one of the 2 points below.
		1- Identify all interrupters per device, then imod can be disabled (executed at least) in all of them, but not amiss.
		2- Identify the correct address, so imod are disabled only in that one, per device.

	-------------------------

	Automated script to disable interrupt moderation / coalesting in all usb controllers

	https://www.overclock.net/threads/usb-polling-precision.1550666/page-61
	https://github.com/djdallmann/GamingPCSetup/tree/master/CONTENT/RESEARCH/PERIPHERALS#universal-serial-bus-usb
	https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md
	https://linustechtips.com/topic/1477802-what-does-changing-driver-interrupt-affinity-cause-the-driver-to-do/
	https://www.overclock.net/threads/usb-polling-precision.1550666/page-61#post-28580928
	https://github.com/djdallmann/GamingPCSetup/issues/12

	Note1: RW command will not run if you have the GUI version open.
	Note2: You should be able to run this script from anywhere as long as you have downloaded the gaming_os_tweaks folder.

	Credits to @BoringBoredom, @amitxv and @djdallmann for helping in different ways.

	-------------------------

	In case you get problems running the script in Win11, you can run the command to allow, and after, another to set back to a safer or undefined policy

	You can check the current policy settings
	Get-ExecutionPolicy -List

	Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Confirm:$false -Force
	Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser -Confirm:$false -Force
#>

# Start as administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

$RWPath = "$(Split-Path -Path $PSScriptRoot -Parent)\tools\RW"

function Apply-Startup-Script {
	$taskName = "InterruptModerationUsb"
	$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
	if (!$taskExists) {
		$action = New-ScheduledTaskAction -Execute "powershell" -Argument "-WindowStyle hidden -ExecutionPolicy Bypass -File $PSScriptRoot\interrupt_moderation_usb.ps1"
		$delay = New-TimeSpan -Seconds 10
		$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay $delay
		$principal = New-ScheduledTaskPrincipal -UserID "LOCALSERVICE" -RunLevel Highest
		Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal
		[Environment]::NewLine

		# In case you have to remove the script from startup, but are not able to do from the UI, run:
		# Unregister-ScheduledTask -TaskName "InterruptModerationUsb"
	}
}

function Apply-Tool-Compatibility-Registries {
	$BuildNumber = Get-WMIObject Win32_OperatingSystem | Select -ExpandProperty BuildNumber
	if ($BuildNumber -ge 22000) {
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Name "Enabled" -Value 0 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" -Name "HypervisorEnforcedCodeIntegrity" -Value 0 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\SystemGuard" -Name "Enabled" -Value 0 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Config" -Name "VulnerableDriverBlocklistEnable" -Value 0 -Force -Type Dword -ErrorAction Ignore
	}
}

function Get-All-USB-Controllers {
	[PsObject[]]$USBControllers= @()

	$allUSBControllers = Get-CimInstance -ClassName Win32_PnPEntity | Where-Object { ($_.Name -match 'USB' -and $_.Name -match 'Controller') -and ($_.Name -match 'Extensible' -or $_.Name -match 'xHCI' -or $_.Name -match 'Host') -and ($_.PNPClass -match 'USB')  } | Select-Object -Property Name, DeviceID
	foreach ($usbController in $allUSBControllers) {
		$allocatedResource = Get-CimInstance -ClassName Win32_PNPAllocatedResource | Where-Object { $_.Dependent.DeviceID -like "*$($usbController.DeviceID)*" } | Select @{N="StartingAddress";E={$_.Antecedent.StartingAddress}}
		$deviceMemory = Get-CimInstance -ClassName Win32_DeviceMemoryAddress | Where-Object { $_.StartingAddress -eq "$($allocatedResource.StartingAddress)" }

		$deviceProperties = Get-PnpDeviceProperty -InstanceId $usbController.DeviceID
		$locationInfo = $deviceProperties | Where KeyName -eq 'DEVPKEY_Device_LocationInfo' | Select -ExpandProperty Data
		$PDOName = $deviceProperties | Where KeyName -eq 'DEVPKEY_Device_PDOName' | Select -ExpandProperty Data

		if ([string]::IsNullOrWhiteSpace($deviceMemory.Name)) {
			continue
		}

		$USBControllers += [PsObject]@{
			Name = $usbController.Name
			DeviceId = $usbController.DeviceID
			MemoryRange = $deviceMemory.Name
			LocationInfo = $locationInfo
			PDOName = $PDOName
		}
	}
	return $USBControllers
}

function Convert-Decimal-To-Hex {
	param ([int64] $value)
	return '0x' + [System.Convert]::ToString($value, 16).ToUpper()
}

function Convert-Hex-To-Decimal {
	param ([string] $value)
	return [convert]::toint64($value, 16)
}

function Clean-Up {
	Stop-Process -Name Rw.exe -Force -ErrorAction Ignore
	Remove-Item -Path "HKCU:\SOFTWARE\RW-Everything" -Recurse -ErrorAction Ignore
}

function Get-Left-Side-From-MemoryRange {
	param ([string] $memoryRange)
	return $memoryRange.Split("-")[0]
}

function Get-VendorId {
	param ([string] $deviceId)
	if ([string]::IsNullOrWhiteSpace($deviceId)) {
		return "None"
	}
	$deviceIdMinInfo = $deviceId.Split("\")[1].Split("&")
	$deviceIdVENValue = $deviceIdMinInfo[0].Split("_")[1]
	$deviceIdDEVValue = $deviceIdMinInfo[1].Split("_")[1]
	return "0x" + $deviceIdDEVValue + $deviceIdVENValue
}

function Find-First-Interrupter {
	param ([string] $memoryRange)
	$LeftSideMemoryRange = Get-Left-Side-From-MemoryRange -memoryRange $memoryRange
	$CapabilityBaseAddressInDecimal = Convert-Hex-To-Decimal -value $LeftSideMemoryRange
	$RuntimeRegisterSpaceOffsetInDecimal = Convert-Hex-To-Decimal -value "0x18"
	$SumCapabilityPlusRuntime = Convert-Decimal-To-Hex -value ($CapabilityBaseAddressInDecimal + $RuntimeRegisterSpaceOffsetInDecimal)
	$Value = & "$RWPath\Rw.exe" /Min /NoLogo /Stdout /Command="R32 $SumCapabilityPlusRuntime" 2>&1 | Out-String
	while ([string]::IsNullOrWhiteSpace($Value)) { Start-Sleep -Seconds 1 }
	$ValueInDecimal = Convert-Hex-To-Decimal -value $Value.Split("=")[1].Trim()
	$TwentyFourValueInDecimal = Convert-Hex-To-Decimal -value "0x24"
	$Interrupter0PreAddressInDecimal = $CapabilityBaseAddressInDecimal + $ValueInDecimal + $TwentyFourValueInDecimal
	return $Interrupter0PreAddressInDecimal
}

function Disable-IMOD {
	param ([string] $address)
	& "$RWPath\Rw.exe" /Min /NoLogo /Stdout /Stderr /Command="W32 $address 0x00000000"
	Start-Sleep -Seconds 1
}

function Get-All-Interrupters {
	param ([int64] $preAddressInDecimal, [string] $deviceName)
	[PsObject[]]$Data = @()
	$interruptersAmount = 1024

	if ($deviceName.Contains('Intel')) { $interruptersAmount = 1024 }
	if ($deviceName.Contains('AMD')) { $interruptersAmount = 8 }

	for ($i=0; $i -lt $interruptersAmount; $i++) {
		$AddressInDecimal = $preAddressInDecimal + (32 * $i)
		$Address = Convert-Decimal-To-Hex -value $AddressInDecimal
		$Data += [PsObject]@{Address = $Address; Interrupter = $i}
	}
	return $Data
}

function ExecuteIMODProcess {
	Write-Host "Started disabling interrupt moderation in all usb controllers"
	[Environment]::NewLine
	Write-Host "------------------------------------------------------------------"
	[Environment]::NewLine

	$USBControllers = Get-All-USB-Controllers

	if ($USBControllers.Length -eq 0) {
		Write-Host "It didnt found any valid USB controllers to be disabled, try opening an issue at the same place you got this script from, take screenshot(s) from all your usb controllers at device manager or some place else you might know how to get, and use as feedback."
	}

	foreach ($item in $USBControllers) {
		$Interrupter0PreAddressInDecimal = Find-First-Interrupter -memoryRange $item.MemoryRange
		$AllInterrupters = Get-All-Interrupters -preAddressInDecimal $Interrupter0PreAddressInDecimal -deviceName $item.Name

		foreach ($interrupterItem in $AllInterrupters) {
			# Disable-IMOD -address $interrupterItem.Address
			Write-Host "Disabled IMOD - Interrupter $($interrupterItem.Interrupter) - Address $($interrupterItem.Address)"
		}

		[Environment]::NewLine
		$VendorId = Get-VendorId -deviceId $item.DeviceId
		Write-Host "Device: $($item.Name)"
		Write-Host "Device ID: $($item.DeviceId)"
		Write-Host "Location Info: $($item.LocationInfo)"
		Write-Host "PDO Name: $($item.PDOName)"
		Write-Host "Vendor ID: $VendorId"
		Write-Host "Memory Range: $($item.MemoryRange)"
		[Environment]::NewLine
		Write-Host "------------------------------------------------------------------"
		[Environment]::NewLine
	}

	Write-Host "Script execution is finished!"
}

# --------------------------------------------------------------------------------------------

# Startup script is optional, because before that you must test the script if will work and not cause BSOD, by not having the startup set, a simple restart should be enough to have it normalized.
# Uncomment line below if you want to apply startup script
# Apply-Startup-Script

# REGs to improve tools compatibility with Win11 - You might need to reboot to take effect
Apply-Tool-Compatibility-Registries

Clean-Up

ExecuteIMODProcess

Clean-Up

cmd /c pause
