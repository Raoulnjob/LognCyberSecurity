  <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 0.

.NOTES
    Author          : Raoul NJOBI
    LinkedIn        : https://www.linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : https://github.com/Raoulnjob/LognCyberSecurity/new/main
    Date Created    : 2026-01-04
    Last Modified   : 2026-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000030).ps1 
#>
# Run PowerShell as Administrator

$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$ValueName = "EnableICMPRedirect"
$ValueData = 0

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
