 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 1 KB (32 MB).

.NOTES
   
    Author          : RAOUL NJOBI
    LinkedIn        : linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : github.com/Raoulnjob
    Date Created    : 03/27/2026
    Last Modified   : 03/272026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000145).ps1 
#>

# Run PowerShell as Administrator

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$ValueName = "DCSettingIndex"
$ValueData = 1

# Create the registry path if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the registry value (REG_DWORD)
New-ItemProperty -Path $RegPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null   
