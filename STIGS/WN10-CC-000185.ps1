 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least alue Name: NoAutorun, value:1.

.NOTES
    Author          : RAOUL NJOBI
    LinkedIn        : linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : github.com/Raoulnjob
    Date Created    : 03/31/2026
    Last Modified   : 03/312026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000185).ps1 
#>
# Run PowerShell as Administrator

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$ValueName = "NoAutorun"
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
