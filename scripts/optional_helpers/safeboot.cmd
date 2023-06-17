:: Enable safeboot on next reboot by using 
:: bcdedit /set {current} safeboot minimal

:: Disable safeboot on reboot 
:: bcdedit /deletevalue {current} safeboot​


:: Could be useful in some situations like Win11, where you are unable to change certain service registry due to heavy permission.