:: Could be useful in some situations like Win11, where you are unable to change certain service registry due to heavy permission.

for /f "tokens=2*" %%a in ('bcdedit /enum ^| find /i "safeboot"') do set "property=%%a"

if [%property%]==[] (
	bcdedit /set {current} safeboot minimal
) else (
 	bcdedit /deletevalue safeboot​
	bcdedit /deletevalue {current} safeboot​
	bcdedit /deletevalue {default} safeboot
)


:: To check manual if the value is set.
:: bcdedit /enum