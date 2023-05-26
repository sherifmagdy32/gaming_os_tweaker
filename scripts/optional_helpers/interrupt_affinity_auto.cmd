:: Get-PnpDevice -PresentOnly -Status OK, DEGRADED, UNKNOWN

:: Get-WmiObject Win32_PNPEntity | Select Name, DeviceID

:: Get-PnpDeviceProperty -InstanceId 'PCI\VEN_10DE&DEV_2208&SUBSYS_39673842&REV_A1\4&1D81E16&0&0019' | Select KeyName, InstanceId

:: InstanceId from DEVPKEY_Device_Parent

:: Get-PnpDeviceProperty -InstanceId 'PCI\VEN_1022&DEV_1483&SUBSYS_88081043&REV_00\3&11583659&0&19'

:: ----------------------------------------------------------------------------------

:: WIP

:: It could automate based on CPU Cores amount
:: Filter by GPU, USB Mouse and LAN
:: Apply same core to each + parent device
:: Just apply tweaks if more 4 or more cores
:: As long as not on Core0 should work

:: Besides that, I could set DevicePriority to High in both Mouse and LAN.
:: Also undo MSI from Mouse.
:: Add MSI to all other devices.
:: Reset DevicePriority from all other devices
:: It would make use of regedit to alter certain aspects

:: There could be certain user choices depending how much results can be filtered. Also in some cases, there are multiple of the same devices, and it could have a different device parent, hence, each child device would need to be dealt separately. But I could use one core per each type of device. If multiple mouses, all in same core, along with its parent.

:: This would replace Interrupt Affinity Tool and MSI Tool.
:: It would be based on pre-choices in attempt to reduce latency to the max in every aspect. Like some mentioned above.

:: https://learn.microsoft.com/en-us/powershell/module/pnpdevice/get-pnpdeviceproperty
:: https://learn.microsoft.com/en-us/powershell/module/pnpdevice/get-pnpdevice