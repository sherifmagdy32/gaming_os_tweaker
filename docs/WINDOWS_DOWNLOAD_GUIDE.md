# Windows Download

Download the ISO through the official microsoft website 

- Windows 10 - <https://www.microsoft.com/software-download/windows10ISO>
- Windows 11 - <https://www.microsoft.com/software-download/windows11>

In case you ARE on windows, you might not enter the page that is for downloading the ISO image directly.

In that case:

- Press F12 in the browser
- Go to the 3 dots on top right > More Tools > Network Conditions > User Agent > Uncheck (Use browser default) > Choose a Custom that is not Windows
- Refresh the page
- Download the ISO
- Download Rufus at <https://rufus.akeo.ie/>
- Create your bootable OS in your USB drive
- Done!

> I recommend disconnecting Wifi/Ethernet from the internet, before you start installing, that way, you can install without requiring a microsoft account and if you do a limited install, it will skip a lot of steps. Primarily useful for Windows 11.

> After you install, activate the windows before applying tweaks [scripts/optional_helpers/activate_windows.cmd](/scripts/optional_helpers/activate_windows.cmd) Add your KEY to the right place in the file. Run as administrator.

> Do all windows update before continuing with scripts. 
