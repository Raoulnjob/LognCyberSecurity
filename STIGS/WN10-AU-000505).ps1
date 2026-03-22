 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows security event log is at less than "15" minutes (excluding "0"), this is a finding.

.NOTES
    Author          : RAOUL NJOBI
    LinkedIn        : linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : github.com/Raoulnjob
    Date Created    : 03/22/2026
    Last Modified   : 03/22/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005  

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-AU-000505).ps1 
#>

# YOUR CODE GOES HERE

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Create the key if it does not exist
If (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the MaxSize value
New-ItemProperty -Path $RegPath -Name "MaxSize" -Value 0x000FA000 -PropertyType DWord -Force 
