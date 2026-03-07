 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : RAOUL NJOBI
    LinkedIn        : linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : github.com/Raoulnjob
    Date Created    : 03/07/2026
    Last Modified   : 03/072026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the registry path if it does not exist
New-Item -Path $path -Force | Out-Null

# Set the MaxSize value
New-ItemProperty -Path $path -Name "MaxSize" -Value 0x8000 -PropertyType DWord -Force 
