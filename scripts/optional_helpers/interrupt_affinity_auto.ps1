<#
  It should be very easy and straight forward to alter in the script whatever choice you would want to test, to be automatically done.
  Whatever it is, it would be in any property -Value

  This script are able to replace Interrupt Affinity Policy Tool and MSI Tool.
  It's based on pre-choices in attempt to reduce latency / DPC avg / input lag in every worth aspect. You can still change values to test if something else works better for you.
  Decimal/Hex values were used instead of Binary, hence why Interrupt Affinity Policy Tool will not recognize the core assigned. LatencyMon should show though.

  Script applies same core to each category, if you have 2 GPUs, it will assign same core for both. Script could evolve later, but wont be for now.
  I put the same class of devices in the same core, it could be that they are on different parent, that could be a problem, mainly for USB devices, or not.

  There could be variation in USB Controller naming, if anyone have any device that are not being considered in this script, you can create an issue.

  Current Choices:
    - Reset all interrupt affinity related options
    - Enable MSI to everything that supports
    - Change Priority to High and Disable MSI to both Mouse and LAN
    - Apply each core (not thread) that is not 0 and is available to each type of devices that is being looked up (Mouse, LAN, GPU) and their proper parent device.

  DevicePolicy: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ne-wdm-_irq_device_policy
  DevicePriority: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ne-wdm-_irq_priority
  GroupPolicy: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/miniport/ns-miniport-_group_affinity
  MessageNumberLimit: https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/page-26#post-5447998
  AssignmentSetOverride: https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/interrupt-affinity-and-priority#about-kaffinity
  MSISupported: Enable MSI
#>

# Start as administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

# Core pre-check
$processorCounts = Get-WmiObject Win32_Processor | Select NumberOfCores, NumberOfLogicalProcessors
$coresAmount = $processorCounts.NumberOfCores
$threadsAmount = $processorCounts.NumberOfLogicalProcessors
$isHyperThreadingActive = $threadsAmount -gt $coresAmount
if ($coresAmount -lt 4) {
	Write-Host 'To apply Interrupt Affinity tweaks, you must have 4 or more cores'
	exit
}

Write-Host "Started applying Interrupt Affinity tweaks!"
[Environment]::NewLine

# Reset affinity and apply MSI tweaks
Get-WmiObject Win32_VideoController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -ErrorAction Ignore
	Set-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Type Dword -ErrorAction Ignore
}
Get-WmiObject Win32_USBController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -ErrorAction Ignore
	Set-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Type Dword -ErrorAction Ignore
}
Get-WmiObject Win32_NetworkAdapter | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -ErrorAction Ignore
	Set-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Type Dword -ErrorAction Ignore
}
Get-WmiObject Win32_IDEController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -ErrorAction Ignore
	Set-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Type Dword -ErrorAction Ignore
}
Get-WmiObject Win32_SoundDevice | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -ErrorAction Ignore
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -ErrorAction Ignore
	Set-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Type Dword -ErrorAction Ignore
}

function Is-Empty-Str {
	param ([string] $value)
	[string]::IsNullOrWhiteSpace($value)
}

function Is-Even {
	param ([int] $value)
	$value % 2 -eq 0
}

# Get all relevant child devices
$allDevices = Get-PnpDevice -PresentOnly -Class ('Mouse', 'Display', 'Net') -Status OK | Sort-Object -Property Class

[PsObject[]]$relevantData = @()

# Get all relevant devices data
for ($i=0; $i -lt $allDevices.Length; $i++) {
	$childDevice = $allDevices[$i]
	$childDeviceName = $childDevice.FriendlyName
	$childDeviceInstanceId = $childDevice.InstanceId
	$childPnpDevice = Get-PnpDeviceProperty -InstanceId $childDeviceInstanceId

	$childPnpDeviceLocationInfo = $childPnpDevice | Where KeyName -eq 'DEVPKEY_Device_LocationInfo' | Select -ExpandProperty Data
	$childPnpDevicePDOName = $childPnpDevice | Where KeyName -eq 'DEVPKEY_Device_PDOName' | Select -ExpandProperty Data

	$parentDeviceInstanceId = $childPnpDevice | Where KeyName -eq 'DEVPKEY_Device_Parent' | Select -ExpandProperty Data

	$childDeviceClass = $childDevice.Class
	$isUSB = $childDeviceClass -in @('Mouse')

	$parentDevice = $null
	$parentDeviceName = ""
	$parentDeviceLocationInfo = ""
	$parentDevicePDOName = ""
	do {
		$parentDevice = Get-PnpDeviceProperty -InstanceId $parentDeviceInstanceId
		$parentDeviceName = $parentDevice | Where KeyName -eq 'DEVPKEY_NAME' | Select -ExpandProperty Data
		$parentDeviceLocationInfo = $parentDevice | Where KeyName -eq 'DEVPKEY_Device_LocationInfo' | Select -ExpandProperty Data
		$parentDevicePDOName = $parentDevice | Where KeyName -eq 'DEVPKEY_Device_PDOName' | Select -ExpandProperty Data
		if ($isUSB -and !$parentDeviceName.Contains('Controller')) {
			$parentDeviceInstanceId = $parentDevice | Where KeyName -eq 'DEVPKEY_Device_Parent' | Select -ExpandProperty Data
		}
	} while (!$parentDeviceName.Contains('Controller') -and $isUSB)

	$relevantData += [PsObject]@{
		ChildDeviceName = $childDeviceName;
		ChildDeviceInstanceId = $childDeviceInstanceId;
		ChildDeviceLocationInfo = $childPnpDeviceLocationInfo;
		ChildDevicePDOName = $childPnpDevicePDOName;
		ParentDeviceName = $parentDeviceName;
		ParentDeviceInstanceId = $parentDeviceInstanceId;
		ParentDeviceLocationInfo = $parentDeviceLocationInfo;
		ParentDevicePDOName = $parentDevicePDOName;
		ClassType = $childDeviceClass;
	}
}

# Build masks per core
[System.Collections.ArrayList]$coresMask = @()
$tempDecimalValue = 1;
$coresValues = if ($isHyperThreadingActive) { $threadsAmount } else { $coresAmount }
for ($i=0; $i -lt $coresValues; $i++) {
	# https://poweradm.com/set-cpu-affinity-powershell/
	[void]$coresMask.Add(@{ Core = $i; Decimal = $tempDecimalValue; })
	$tempDecimalValue = $tempDecimalValue * 2
}

# Build cores to be used
[System.Collections.ArrayList]$coresToBeUsed = @()
foreach ($item in $relevantData) {
	for ($i=1; $i -le $coresAmount; $i++) {
		$core = if ($isHyperThreadingActive) { if (Is-Even -value $i) { $i } else { $i+1 } } else { $i }
		if (!($coresToBeUsed | Where-Object { $_.Core -eq $core })) {
			if (!($coresToBeUsed | Where-Object { $_.ClassType -eq $item.ClassType })) {
				$coreMask = $coresMask | Where-Object { $_.Core -in ($core) }
				[void]$coresToBeUsed.Add(@{Core = $core; Decimal = $coreMask.Decimal; ClassType = $item.ClassType })
			}
		}
	}
}

# Apply interrupt affinity tweaks
foreach ($item in $relevantData) {
	$ChildDeviceName = $item.ChildDeviceName
	$ChildDeviceInstanceId = $item.ChildDeviceInstanceId
	$ChildDeviceLocationInfo = if (Is-Empty-Str -value $item.ChildDeviceLocationInfo) { "None" } else { $item.ChildDeviceLocationInfo }
	$ChildDevicePDOName = $item.ChildDevicePDOName
	$ParentDeviceName = $item.ParentDeviceName
	$ParentDeviceInstanceId = $item.ParentDeviceInstanceId
	$ParentDeviceLocationInfo = $item.ParentDeviceLocationInfo
	$ParentDevicePDOName = $item.ParentDevicePDOName
	$ClassType = $item.ClassType

	$parentAffinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ParentDeviceInstanceId\Device Parameters\Interrupt Management\Affinity Policy"
	$childAffinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ChildDeviceInstanceId\Device Parameters\Interrupt Management\Affinity Policy"
	$parentMsiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ParentDeviceInstanceId\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	$childMsiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ChildDeviceInstanceId\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"

	if ($ClassType -eq 'Net') {
		Set-ItemProperty -Path $childAffinityPath -Name "DevicePriority" -Value 3 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path $childMsiPath -Name "MSISupported" -Value 0 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path $childMsiPath -Name "MessageNumberLimit" -Value 2 -Force -Type Dword -ErrorAction Ignore
	}
	if ($ClassType -eq 'Mouse') {
	 	Set-ItemProperty -Path $parentAffinityPath -Name "DevicePriority" -Value 3 -Force -Type Dword -ErrorAction Ignore
		Set-ItemProperty -Path $parentMsiPath -Name "MSISupported" -Value 0 -Force -Type Dword -ErrorAction Ignore
	}

	Set-ItemProperty -Path $parentAffinityPath -Name "DevicePolicy" -Value 4 -Force -Type Dword -ErrorAction Ignore
	Set-ItemProperty -Path $childAffinityPath -Name "DevicePolicy" -Value 4 -Force -Type Dword -ErrorAction Ignore

	$coreData = $coresToBeUsed | Where-Object { $item.ClassType -eq $_.ClassType }

	Set-ItemProperty -Path $parentAffinityPath -Name "AssignmentSetOverride" -Value $coreData.Decimal -Force -Type Qword -ErrorAction Ignore
	Set-ItemProperty -Path $childAffinityPath -Name "AssignmentSetOverride" -Value $coreData.Decimal -Force -Type Qword -ErrorAction Ignore

	Write-Host "Assigned to Core $($coreData.Core)"
	Write-Host "Device: $ChildDeviceName - $ChildDeviceInstanceId"
	Write-Host "Location Info: $ChildDeviceLocationInfo"
	Write-Host "PDO Name: $ChildDevicePDOName"
	Write-Host "Parent Device: $ParentDeviceName - $ParentDeviceInstanceId"
	Write-Host "Location Info: $ParentDeviceLocationInfo"
	Write-Host "PDO Name: $ParentDevicePDOName"
	[Environment]::NewLine
}

cmd /c pause
