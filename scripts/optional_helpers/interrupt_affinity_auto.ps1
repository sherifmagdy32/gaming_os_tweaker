<#
  ### WIP - Core assignment part are still not done. Remove this line once done.

  It should be very easy and straight forward to alter in the script whatever choice you would want to test, to be automatically done.
  Whatever it is, it would be in any property -Value

  This are able to replace Interrupt Affinity Tool and MSI Tool.
  It's based on pre-choices in attempt to reduce latency to the max in every aspect. You can still change values to test if something else works better for you.

  It's expecting you to have one LAN and one GPU. Script could evolve later, but wont be for now.

  There could be variation in controller naming, if anyone have any device that are not being considered in this script, can create an issue.

  DevicePolicy: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ne-wdm-_irq_device_policy
  DevicePriority: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ne-wdm-_irq_priority
  GroupPolicy: https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/miniport/ns-miniport-_group_affinity
  MessageNumberLimit: https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/page-26#post-5447998
  AssignmentSetOverride: https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/interrupt-affinity-and-priority#about-kaffinity
  MSISupported: Enable MSI
#>

# Start with administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

# Core pre-check
$processorCounts = Get-WmiObject -class Win32_processor | Select NumberOfCores, NumberOfLogicalProcessors
$coresAmount = $processorCounts.NumberOfCores
$threadsAmount = $processorCounts.NumberOfLogicalProcessors
$isHyperThreadingActive = $threadsAmount -gt $coresAmount
if ($coresAmount -lt 4) {
	Write-Host 'You must have 4 or more cores'
	exit
}

Write-Host "Started applying Interrupt Affinity tweaks!"
[Environment]::NewLine

# Get all relevant child devices
$allDevices = Get-PnpDevice -PresentOnly -Class ('Mouse', 'Keyboard', 'Display', 'Net') -Status OK | Sort-Object -Property Class

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
	$isUSB = $childDeviceClass -in @('Mouse', 'Keyboard')

	$parentDevice = $null
	$parentDeviceName = ""
	$parentDeviceLocationInfo = ""
	$parentDevicePDOName = ""
	do {
		$parentDevice = Get-PnpDeviceProperty -InstanceId $parentDeviceInstanceId
		$parentDeviceName = $parentDevice | Where KeyName -eq 'DEVPKEY_NAME' | Select -ExpandProperty Data
		$parentDeviceLocationInfo = $parentDevice | Where KeyName -eq 'DEVPKEY_Device_LocationInfo' | Select -ExpandProperty Data
		$parentDevicePDOName = $parentDevice | Where KeyName -eq 'DEVPKEY_Device_PDOName' | Select -ExpandProperty Data
		if ($isUSB) {
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

# Reset affinity and apply MSI tweaks
Get-WmiObject Win32_VideoController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	New-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Verbose -PropertyType Dword
}
Get-WmiObject Win32_USBController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -Verbose
	Remove-ItemProperty -Path $affinityPathpath -Name "AssignmentSetOverride" -Force -Verbose
	New-ItemProperty -Path $msiPath -Name "MSISupported" -Value 0 -Force -Verbose -PropertyType Dword
}
Get-WmiObject Win32_NetworkAdapter | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	New-ItemProperty -Path $msiPath -Name "MSISupported" -Value 0 -Force -Verbose -PropertyType Dword
	New-ItemProperty -Path $msiPath -Name "MessageNumberLimit" -Value 256 -Force -Verbose -PropertyType Dword
}
Get-WmiObject Win32_IDEController | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	New-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Verbose -PropertyType Dword
}
Get-WmiObject Win32_SoundDevice | Where-Object PNPDeviceID -Match "PCI\\VEN*" | Select-Object -ExpandProperty PNPDeviceID | ForEach {
	$devicePath = $_
	$affinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\Affinity Policy"
	$msiPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$devicePath\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePolicy" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "DevicePriority" -Force -Verbose
	Remove-ItemProperty -Path $affinityPath -Name "AssignmentSetOverride" -Force -Verbose
	New-ItemProperty -Path $msiPath -Name "MSISupported" -Value 1 -Force -Verbose -PropertyType Dword
}

# Apply interrupt affinity tweaks
foreach ($item in $relevantData) {
	$ChildDeviceName = $item.ChildDeviceName
	$ChildDeviceInstanceId = $item.ChildDeviceInstanceId
	$ChildDeviceLocationInfo = $item.ChildDeviceLocationInfo
	$ChildDevicePDOName = $item.ChildDevicePDOName
	$ParentDeviceName = $item.ParentDeviceName
	$ParentDeviceInstanceId = $item.ParentDeviceInstanceId
	$ParentDeviceLocationInfo = $item.ParentDeviceLocationInfo
	$ParentDevicePDOName = $item.ParentDevicePDOName
	$ClassType = $item.ClassType

	$parentAffinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ParentDeviceInstanceId\Device Parameters\Interrupt Management\Affinity Policy"
	$childAffinityPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$ChildDeviceInstanceId\Device Parameters\Interrupt Management\Affinity Policy"
	if ($ClassType -in @('Mouse', 'Net')) {
		New-ItemProperty -Path $childAffinityPath -Name "DevicePriority" -Value 3 -Force -Verbose -PropertyType Dword
	}

	New-ItemProperty -Path $parentAffinityPath -Name "DevicePolicy" -Value 4 -Force -Verbose -PropertyType Dword
	New-ItemProperty -Path $childAffinityPath -Name "DevicePolicy" -Value 4 -Force -Verbose -PropertyType Dword

	########################## WIP - TODO after this line ##############################################################

	# Even if I put the same class of device in same core, it could be that they are on different parent, that could be a problem, mainly for USB devices.

	# $coresAmount
	# $isHyperThreadingActive

	New-ItemProperty -Path $parentAffinityPath -Name "AssignmentSetOverride" -Value 0 -Force -Verbose -PropertyType Dword
	New-ItemProperty -Path $childAffinityPath -Name "AssignmentSetOverride" -Value 0 -Force -Verbose -PropertyType Dword

	###########################################################################################################################

	Write-Host "Core N" # Change this N to the actual core being used
	Write-Host "Device: $ChildDeviceName - $ChildDeviceInstanceId"
	Write-Host "Device Location Info: $ChildDeviceLocationInfo"
	Write-Host "Device PDO Name: $ChildDevicePDOName"
	Write-Host "Parent Device: $ParentDeviceName - $ParentDeviceInstanceId"
	Write-Host "Parent Device Location Info: $ParentDeviceLocationInfo"
	Write-Host "Parent Device PDO Name: $ParentDevicePDOName"
	[Environment]::NewLine
}

cmd /c pause
