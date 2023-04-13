:: https://winget.run/
:: https://winstall.app/

:: Install Winget through this or use https://github.com/microsoft/winget-cli/releases with .msixbundle file
powershell "Install-Module WingetTools"

winget install -e --id Microsoft.DirectX

:: Replace native Windows Menu
winget install -e --id Open-Shell.Open-Shell-Menu

:: Replace every other browser
winget install -e --id Brave.Brave --accept-package-agreements

:: Replace 7Zip and WinRAR
winget install -e --id M2Team.NanaZip

:: Replace Notepad
winget install -e --id Notepad++.Notepad++
:: winget install -e --id VSCodium.VSCodium

:: Replace Paint
winget install -e --id dotPDNLLC.paintdotnet

:: Screenshot and more
:: winget install -e --id ShareX.ShareX

:: GPU OC + OSD
:: winget install -e --id Guru3D.Afterburner

:: Voice + Chat
:: winget install -e --id Discord.Discord

:: Replace any other Media Player
:: winget install -e --id clsid2.mpc-hc
:: winget install -e --id Nevcairiel.LAVFilters
:: winget install -e --id VideoLAN.VLC

:: Torrent
:: winget install -e --id qBittorrent.qBittorrent

:: Gaming
:: winget install -e --id Valve.Steam

:: winget install -e --id Microsoft.PowerShell
:: winget install -e --id Microsoft.WindowsTerminal