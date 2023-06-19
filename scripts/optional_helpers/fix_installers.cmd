:: In case some installers are not working through click or winget, e.g., .msixbundle, .appinstaller, .appx, .appxbundle, some packages from winget.

:: I dont know all the things in all the tweaks+debloat that would cause this to break, If someone wants to find out, in the simplest and cleanest way and make a PR. Try to get it working with the minimum enabled.

:: Try to build a sort of toggle in this, so each time you run the script, it will enable or disable everything that it end up going through here.

:: WIP

:: ------------------------------------------------------------------------

:: WIP Notes

:: sc query service_name

:: sc config wuauserv start= demand
:: sc config BITS start= auto
:: sc config DoSvc start= delayed-auto

:: Does not exist on Win11
:: sc config uhssvc start= delayed-auto 

:: sc config UsoSvc start= auto
:: sc config WaaSMedicSVC start= demand

:: net start wuauserv :: Default Manual
:: net start BITS :: Default Auto
:: net start DoSvc :: Default Delayed Auto
:: net start uhssvc :: Default Disabled or Delayed Auto
:: net start UsoSvc :: Default Auto
:: net start msiserver :: Default Auto
:: net start WaaSMedicSVC :: Didnt want to initialize - Default Manual
:: net start AppXSvc
:: net start wlidsvc
:: net start WSService :: Maybe it was removed too, it was invalid when I tried

:: net start InstallService :: Was kept default manual
:: net start PushToInstall :: Was kept default manual - But in my case, was removed by mistake.
:: net start DcomLaunch :: Was kept default auto, to not break other dependent parts.
:: net start TrustedInstaller :: Was kept default manual.

:: Still didnt work, maybe because PushToInstall service was removed.
:: I removed the command that was removing that service, only someone with it should be able to confirm.

:: Even after having all the above started with the exception of PushToInstall that was mistakenly removed and I am not able to restore. Maybe that is the reason, if not, maybe something else or REGs could be the cause. In my case, only after an reinstall probably. It will be if that happen or someone else are able to get it working.

:: ---------------------------------------------------------------------------

:: Packages to test and make work
:: winget install Calculator --accept-package-agreements
:: winget install -e --id 9MSMLRH6LZF3 --accept-package-agreements

:: It could be that Nvidia Control Panel are not longer being installed with the driver is that, when finishing up the installation, it requires connection with the internet, maybe what it does is, download the panel from the MS Store, but since the services are disabled, is not working. So, no nvidia control panel. Or it already includes the installation but since some of the above is not working, same issue.
:: Through ms store, it would be installable by using
:: winget install -e --id 9NF8H0H7WMLT --accept-package-agreements
:: Clearly it's another reason to fix this.

:: Commands like these do not work to restore what is already removed, because it seems to use windows update to restore, if it's already disabled/removed, then is why does not work.
:: sfc/scannow
:: DISM /Online /Cleanup-Image /RestoreHealth 
:: If you have Windows in a disk/usb, you can point to it instead. Change G: to where windows installation is in.
:: DISM /Online /Cleanup-Image /RestoreHealth /Source:G:\Sources\install.wim /LimitAccess
:: I have tried both of these options, it did not work.