<#PSScriptInfo
.VERSION 1.0.0
.GUID 21dcde37-a510-49b5-88d5-33400d76b980
.AUTHOR AndrewTaylor
.DESCRIPTION Installs PS7, Winget and Company Portal
.COMPANYNAME 
.COPYRIGHT GPL
.TAGS intune endpoint MEM environment winget win32
.LICENSEURI https://github.com/andrew-s-taylor/public/blob/main/LICENSE
.PROJECTURI https://github.com/andrew-s-taylor/public
.ICONURI 
.EXTERNALMODULEDEPENDENCIES
.REQUIREDSCRIPTS 
.EXTERNALSCRIPTDEPENDENCIES 
.RELEASENOTES
#>
<#
.SYNOPSIS
  Installs PS7, Winget and Company Portal
.DESCRIPTION
.Installs PS7, Winget and Company Portal

.INPUTS
None
.OUTPUTS
In-Line Outputs
.NOTES
  Version:        1.0.0
  Author:         Andrew Taylor
  Twitter:        @AndrewTaylor_2
  WWW:            andrewstaylor.com
  Creation Date:  27/11/2023
.EXAMPLE
N/A
#>

# GitHub API endpoint for PowerShell releases
# GitHub API endpoint for PowerShell releases
$githubApiUrl = 'https://api.github.com/repos/PowerShell/PowerShell/releases/latest'

# Fetch the latest release details
$release = Invoke-RestMethod -Uri $githubApiUrl

##Find asset with .msi in the name
$asset = $release.assets | Where-Object { $_.name -like "*msi*" -and $_.name -like "*x64*" }

# Get the download URL and filename of the asset (assuming it's a MSI file)
$downloadUrl = $asset.browser_download_url
$filename = $asset.name

# Download the latest release
Invoke-WebRequest -Uri $downloadUrl -OutFile $filename

# Install PowerShell 7
Start-Process msiexec.exe -Wait -ArgumentList "/I $filename /qn"

# Start a new PowerShell 7 session
$pwshExecutable = "C:\Program Files\PowerShell\7\pwsh.exe"

# Run a script block in PowerShell 7
& $pwshExecutable -Command {
  $provider = Get-PackageProvider NuGet -ErrorAction Ignore
  if (-not $provider) {
    Write-Host "Installing provider NuGet"
    Find-PackageProvider -Name NuGet -ForceBootstrap -IncludeDependencies
  }
}
& $pwshExecutable -Command Install-Module microsoft.winget.client -Force -AllowClobber 
& $pwshExecutable -Command Import-Module microsoft.winget.client
& $pwshExecutable -Command Repair-WingetPackageManager -Force -Latest -Verbose


$ResolveWingetPath = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"

if ($ResolveWingetPath) {
  $WingetPath = $ResolveWingetPath[-1].Path
  $Winget = $WingetPath + "\winget.exe"
  &$winget list --id 7zip --accept-source-agreements --accept-package-agreements
}

    
   