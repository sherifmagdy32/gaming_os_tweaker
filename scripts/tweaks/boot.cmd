:: Constantly pool interrupts, dynamic tick was implemented as a power saving feature
bcdedit /set disabledynamictick yes

bcdedit /deletevalue useplatformclock
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set useplatformtick yes

:: Apply MSI to devices by default
bcdedit /set MSI Default

:: Disable Hyper-V
bcdedit /set hypervisorlaunchtype off

:: Avoid the use of uncontiguous portions of low-memory from the OS. Boosts memory performance and improves microstuttering at least 80% of the cases. Also fixes the command buffer stutter after disabling 5-level paging on 10th gen Intel. Causes system freeze on unstable memory sticks.
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes

:: Disable DMA memory protection and cores isolation ("virtualization-based protection").
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No

:: Enable X2Apic and enable Memory Mapping for PCI-E devices.
bcdedit /set x2apicpolicy Enable
bcdedit /set configaccesspolicy Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No

:: Disable Early Launch Anti-Malware Protection
bcdedit /set disableelamdrivers Yes

:: Disable some of the kernel memory mitigations. Causes boot crash/loops if Intel SGX is enforced and not set to "Application Controlled" or "Off" in your Firmware. Gamers don't use SGX under any possible circumstance.
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

:: Disable 57-bits 5-level paging, also known as "Linear Address 57". Only 100% effective on 10th gen Intel. 256 TB of virtual memory per-disk is way much more than enough anyway.
bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328

:: Disable DEP
bcdedit /set nx AlwaysOff

:: Speed boot time a bit
bcdedit /set quietboot yes
bcdedit /timeout 0
bcdedit /set {globalsettings} custom:16000067 true

:: ===============================================================================================================================================================

:: Speed up startup
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DelayedDesktopSwitchTimeout /t REG_DWORD /d 0 /f

:: Enable detailed startup/shutdown messages
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v VerboseStatus /t REG_DWORD /d 1 /f

:: Decrease shutdown time
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f

:: Disable Fast Startup
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

:: Disable Logon animation
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f