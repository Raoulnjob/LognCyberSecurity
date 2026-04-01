  <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 1.

.NOTES
    Author          : Raoul NJOBI
    LinkedIn        : https://www.linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : https://github.com/Raoulnjob/LognCyberSecurity/new/main
    Date Created    : 2026-31-03
    Last Modified   : 2026-31-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005  

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 
#>
# Run PowerShell as Administrator

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenCamera"
$ValueData = 1

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the registry value (REG_DWORD)
New-ItemProperty -Path $RegPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null 
