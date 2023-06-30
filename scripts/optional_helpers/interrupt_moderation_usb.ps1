<#
	WIP (not done)

	-------------------------

	Automated script to disable interrupt moderation / coalesting in all usb controllers

	https://www.overclock.net/threads/usb-polling-precision.1550666/page-61
	https://github.com/djdallmann/GamingPCSetup/tree/master/CONTENT/RESEARCH/PERIPHERALS#universal-serial-bus-usb
	https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md
	https://linustechtips.com/topic/1477802-what-does-changing-driver-interrupt-affinity-cause-the-driver-to-do/
	https://github.com/djdallmann/GamingPCSetup/issues/12

	Note1: RW command will not run if you have the GUI version open.
	Note2: You should be able to run this script from anywhere as long as you have downloaded the gaming_os_tweaks folder.

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

$tempMemDumpFileName = "TEMP_MEM_DUMP"
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
		$allocatedResource = Get-CimInstance -ClassName Win32_PNPAllocatedResource | Where-Object { $_.Dependent.DeviceID -like "*$($usbController.DeviceID)*" } | Select @{N="StartingAddress";E={$_.Antecedent.StartingAddress}}, @{N="IRQ";E={$_.Antecedent.IRQNumber}}
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
			IRQ = $allocatedResource.IRQ
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
	Remove-Item -Path $RWPath\$tempMemDumpFileName*
}

function Apply-IRQ-Priotity-Optimization {
	param ([string] $IRQValue)
	$IRQSplit = $IRQValue.Trim().Split(" ")
	foreach ($IRQ in $IRQSplit) {
		Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "IRQ$($IRQ)Priority" -Value 1 -Force -Type Dword -ErrorAction Ignore
	}
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

function Build-Filename {
	param ([string] $memoryRange)
	$LeftSideMemoryRange = Get-Left-Side-From-MemoryRange -memoryRange $memoryRange
	return "$tempMemDumpFileName-$LeftSideMemoryRange"
}

function Dump-Memory-File {
	param ([string] $memoryRange)
	$LeftSideMemoryRange = Get-Left-Side-From-MemoryRange -memoryRange $memoryRange
	$fileName = Build-Filename -memoryRange $memoryRange

	$CapabilityBaseAddressInDecimal = Convert-Hex-To-Decimal -value $LeftSideMemoryRange
	$RuntimeRegisterSpaceOffsetInDecimal = Convert-Hex-To-Decimal -value "0x18"
	$SumCapabilityPlusRuntime = Convert-Decimal-To-Hex -value ($CapabilityBaseAddressInDecimal + $RuntimeRegisterSpaceOffsetInDecimal)
	$Value = & "$RWPath\Rw.exe" /Min /NoLogo /Stdout /Command="R32 $SumCapabilityPlusRuntime" 2>&1 | Out-String
	while ([string]::IsNullOrWhiteSpace($Value)) { Start-Sleep -Seconds 1 }
	$ValueInDecimal = Convert-Hex-To-Decimal -value $Value.Split("=")[1].Trim()
	$TwentyFourValueInDecimal = Convert-Hex-To-Decimal -value "0x24"
	$Interrupter0Address = Convert-Decimal-To-Hex -value ($CapabilityBaseAddressInDecimal + $ValueInDecimal + $TwentyFourValueInDecimal + (32 * 0))

	# It will dump everything from this address forward, all the way to interrupter 1023
	& "$RWPath\Rw.exe" /Min /NoLogo /Stdout /Stderr /Command="DMEM $Interrupter0Address 33000 $RWPath\$fileName" | Out-Null
	while (!(Test-Path -Path $RWPath\$fileName)) { Start-Sleep -Seconds 1 }
}

function Disable-IMOD {
	param ([string] $address)
	& "$RWPath\Rw.exe" /Min /NoLogo /Stdout /Stderr /Command="W32 $address 0x00000000"
	Start-Sleep -Seconds 1
}

function Parse-File-Content {
	param ([string] $memoryRange)
	[PsObject[]]$TempArr = @()
	[PsObject[]]$Data = @()

	$fileName = Build-Filename -memoryRange $memoryRange
	$dumpedContent = Get-Content -Path "$RWPath\$fileName" | Select-Object -Skip 2

	foreach ($line in $dumpedContent) {
		$cleanLine = $line.Split("`t")[0].Trim();
		$lineSplit = $cleanLine.Split(" ")
		$lineNumber = $lineSplit[0]
		$first32BitValue = '0x' + $lineSplit[4] + $lineSplit[3] + $lineSplit[2] + $lineSplit[1]
		$second32BitValue = '0x' + $lineSplit[8] + $lineSplit[7] + $lineSplit[6] + $lineSplit[5]
		$third32BitValue = '0x' + $lineSplit[12] + $lineSplit[11] + $lineSplit[10] + $lineSplit[9]
		$forth32BitValue = '0x' + $lineSplit[16] + $lineSplit[15] + $lineSplit[14] + $lineSplit[13]

		$TempArr += [PsObject]@{Value = $first32BitValue; TopLeftPosition = ""; Line = $lineNumber; Interrupter = ""}
		$TempArr += [PsObject]@{Value = $second32BitValue; TopLeftPosition = ""; Line = $lineNumber; Interrupter = ""}
		$TempArr += [PsObject]@{Value = $third32BitValue; TopLeftPosition = ""; Line = $lineNumber; Interrupter = ""}
		$TempArr += [PsObject]@{Value = $forth32BitValue; TopLeftPosition = ""; Line = $lineNumber; Interrupter = ""}
	}

	$interrupterCount = 0
	$topLeftCount = 0
	for ($i=0; $i -lt $TempArr.Length; $i++) {
		$item = $TempArr[$i]
		if (($i + 1) % 8 -eq 0) { $interrupterCount += 1 }
		if ($interrupterCount -ge 1024) { break }
		$Data += [PsObject]@{Value = $item.Value; TopLeftPosition = $topLeftCount; Line = $item.Line; Interrupter = $interrupterCount}
		$topLeftCount += 4
	}
	return $Data
}

function Build-Address {
	param ([string] $memoryRange)
	$parsedContent = Parse-File-Content -memoryRange $memoryRange
	# TODO - Lacking information in how find the correct address in between all 1024 interrupters addresses, as to disable imod.
	return ''
}

function ExecuteIMODProcess {
	Write-Host "Started disabling interrupt moderation in all usb controllers"
	[Environment]::NewLine

	$USBControllers = Get-All-USB-Controllers
	foreach ($item in $USBControllers) {
		Apply-IRQ-Priotity-Optimization -IRQValue $item.IRQ
		Dump-Memory-File -memoryRange $item.MemoryRange

		$Address = Build-Address -memoryRange $item.MemoryRange
		if ([string]::IsNullOrWhiteSpace($Address)) {
			Write-Host "Address is empty, didnt found any valid to disable IMOD"
			continue
		}
		Disable-IMOD -address $Address

		$VendorId = Get-VendorId -deviceId $item.DeviceId
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
