:: In case some installers are not working through click or winget, e.g., .msixbundle, .appinstaller, some packages from winget.

:: I dont know all the things in all the tweaks+debloat that would cause this to break, If someone wants to find out, in the simplest and cleanest way and make a PR.

:: WIP

:: ------------------------------------------------------------------------
:: WIP Notes

:: Packages to test and make work
:: winget install Calculator --accept-package-agreements
:: winget install -e --id 9MSMLRH6LZF3 --accept-package-agreements

:: Commands for possible services related
:: sc.exe query DoSvc
:: sc.exe config DoSvc start= delayed-auto

:: net start wuauserv
:: net start bits
:: net start DcomLaunch
:: net start WaaSMedicSVC - Didnt want to initialize
:: net start DoSvc

:: Still didnt work, maybe because PushInstall service was removed. But not sure. 
:: I removed the command that was removing that service, only someone with it should be able to confirm.
:: Still not solved.
