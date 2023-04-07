# Put this in rawaccel folder along side all the profile .json you have created. 
# Run with Powershell, choose Yes to run as Administrator.
# Select the profile you want to activate.

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}
Set-ExecutionPolicy Bypass -Scope Process
Push-Location $PSScriptRoot

$profiles = @(Get-ChildItem -Path .\ -Filter *.json -r | % { $_.Name })

function Apply-Profile {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[string]$profile_name
	)

	$value = $profiles[$profile_name]
	$exists = $profiles.Contains($value)
	if ($exists) {
		.\writer.exe $value
		Write-Host "Profile $value applied successfully!"
		SetupExecuteOnStartup -profile_value $value
		Write-Host "All Done!"
		break
	} else {
		Write-Host "Profile invalid, try again!"
	}
}

function SetupExecuteOnStartup {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[string]$profile_value
	)
	
	[Environment]::NewLine
	$startup = Read-Host "Do you wish set $profile_value to automatically start on windows startup? [Y] or [N]"
	if ($startup -eq "Y") {
		$taskName = "rawaccelProfileStartup"
		$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
		if ($taskExists) {
			Write-Host "Updating rawaccel profile startup to $profile_value"
			$action = New-ScheduledTaskAction -Execute "$PSScriptRoot\writer.exe" -Argument "$PSScriptRoot\$profile_value"
			Set-ScheduledTask -TaskName $taskName -Action $action
		} else {
			Write-Host "Registering rawaccel profile startup to $profile_value"
			$action = New-ScheduledTaskAction -Execute "$PSScriptRoot\writer.exe" -Argument "$PSScriptRoot\$profile_value"
			$trigger = New-ScheduledTaskTrigger -AtLogOn
			Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger
		}
		[Environment]::NewLine
		Write-Host "Done setting up profile on startup!"
	} else {
		[Environment]::NewLine
		Write-Host "Profile were NOT setup to startup!"
	}
}

function SetupApplyProfile {
	Write-Host "RawAccel Profiles"
	[Environment]::NewLine

	For ($i=0; $i -lt $profiles.Length; $i++) {
		$label = $profiles[$i]
		Write-Host "[$i] $label"
	}

	while ($true) {
		[Environment]::NewLine
		[int]$result = Read-Host "Select a RAW Accel Profile"
		Apply-Profile -profile_name $result
	}
	[Environment]::NewLine
	cmd /c pause
}

SetupApplyProfile