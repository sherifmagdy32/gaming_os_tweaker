:: https://winget.run/
:: https://winstall.app/

:: Install Winget through this or use https://github.com/microsoft/winget-cli/releases with .msixbundle file
powershell "Install-Module WingetTools"

winget install -e --id Brave.Brave --accept-package-agreements
winget install -e --id Notepad++.Notepad++
winget install -e --id Microsoft.DirectX
winget install -e --id M2Team.NanaZip
winget install -e --id Open-Shell.Open-Shell-Menu

:: winget install -e --id Microsoft.PowerShell
:: winget install -e --id Guru3D.Afterburner
:: winget install -e --id Discord.Discord
:: winget install -e --id Valve.Steam
:: winget install -e --id clsid2.mpc-hc
:: winget install -e --id Nevcairiel.LAVFilters
:: winget install -e --id VideoLAN.VLC
:: winget install -e --id qBittorrent.qBittorrent
:: winget install -e --id VSCodium.VSCodium
:: winget install -e --id Microsoft.WindowsTerminal