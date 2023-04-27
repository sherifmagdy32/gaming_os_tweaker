:: https://winget.run/
:: https://winstall.app/

:: Install Winget through this or use https://github.com/microsoft/winget-cli/releases with .msixbundle file
powershell "Install-Module WingetTools"

:: You can update them all by running
:: winget upgrade --all

:: You can make it run automatically in every windows startup by running this command once
:: powershell -c "$action = New-ScheduledTaskAction -Execute \"powershell\" -Argument \"-WindowStyle hidden -Command winget upgrade --all\"; $trigger = New-ScheduledTaskTrigger -AtLogOn; $principal = New-ScheduledTaskPrincipal -UserID $env:USERNAME -RunLevel Highest; Register-ScheduledTask -TaskName \"AutoUpdateWingetApps\" -Action $action -Trigger $trigger -Principal $principal;"

:: You can install Windows Store apps by using their id
:: https://apps.microsoft.com/store/detail/netflix/9WZDNCRFJ3TJ
:: winget install -e --id 9WZDNCRFJ3TJ

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
:: winget install -e --id Microsoft.VisualStudioCode

:: Replace Paint
winget install -e --id dotPDNLLC.paintdotnet

:: Replace calculator or if you want it back.
:: winget install -e --id Qalculate.Qalculate
:: winget install calculator --accept-package-agreements

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
:: winget install -e --id EpicGames.EpicGamesLauncher
:: winget install -e --id OBSProject.OBSStudio

:: -----------------------------------------------------------------------------------------

:: Alternatively you can use the most popular one. Chocolatey. Install using the following command.

:: Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

:: Packages at https://community.chocolatey.org/packages

:: Replace File Explorer
:: choco install files -y