:: Clean up Windows Update
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

rmdir /s /q C:\Windows\SoftwareDistribution.old
rmdir /s /q C:\Windows\System32\catroot2.old
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old

net start wuauserv
net start cryptSvc
net start bits
net start msiserver

:: 0x80070643 - Error seems related to WSL
:: https://github.com/microsoft/WSL/issues/7222#issuecomment-939469616
