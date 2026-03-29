 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
 
    Author          : RAOUL NJOBI
    LinkedIn        : linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : github.com/Raoulnjob
    Date Created    : 03/28/2026
    Last Modified   : 03/28/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000245 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000245).ps1 
#>

# Run PowerShell as Administrator

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "ConsentPromptBehaviorUser"
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
