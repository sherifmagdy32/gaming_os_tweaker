# Put this in rawaccel folder along side all the profile .json you have created. Run with Powershell and select the one you want to activate.

Push-Location $PSScriptRoot

$title = "RawAccel Profiles"
$prompt = "Select a RAW Accel Profile"
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
		break
	} else {
		Write-Host "Profile invalid, try again!"
	}
}

Write-Host $title
[Environment]::NewLine

For ($i=0; $i -lt $profiles.Length; $i++) {
    $label = $profiles[$i]
    Write-Host "[$i] $label"
}

while ($true) {
	[Environment]::NewLine
	[int]$result = Read-Host $prompt
	Apply-Profile -profile_name $result
}

[Environment]::NewLine
cmd /c pause