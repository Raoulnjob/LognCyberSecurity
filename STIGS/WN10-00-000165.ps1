 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least SMB1.

.NOTES
    Author          : Raoul NJOBI
    LinkedIn        : https://www.linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : https://github.com/Raoulnjob/LognCyberSecurity/new/main
    Date Created    : 2026-27-03
    Last Modified   : 2026-27-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000165 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-00-000165).ps1 
#>

# Run PowerShell as Administrator

$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
$ValueName = "SMB1"
$ValueData = 0

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Create or update the SMB1 value (REG_DWORD)
New-ItemProperty -Path $RegPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null 
