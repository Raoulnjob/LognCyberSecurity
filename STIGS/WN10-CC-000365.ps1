  <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 2.

.NOTES
    Author          : Raoul NJOBI
    LinkedIn        : https://www.linkedin.com/in/raoul-njobi-6a97333ab/
    GitHub          : https://github.com/Raoulnjob/LognCyberSecurity/new/main
    Date Created    : 2026-03-04
    Last Modified   : 2026-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365  

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000365 ).ps1 
#>
# Run PowerShell as Administrator

$BasePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"

# Ensure the base registry path exists
if (-not (Test-Path $BasePath)) {
    New-Item -Path $BasePath -Force | Out-Null
}

# Check if LetAppsActivateWithVoice exists and equals 2 (NA condition)
$VoiceSetting = Get-ItemProperty -Path $BasePath -Name "LetAppsActivateWithVoice" -ErrorAction SilentlyContinue

if ($VoiceSetting -and $VoiceSetting.LetAppsActivateWithVoice -eq 2) {
    Write-Output "STIG Status: NA - LetAppsActivateWithVoice is set to 2"
}
else {
    # Apply required setting
    New-ItemProperty -Path $BasePath `
        -Name "LetAppsActivateWithVoiceAboveLock" `
        -Value 2 `
        -PropertyType DWord `
        -Force | Out-Null

    Write-Output "LetAppsActivateWithVoiceAboveLock set to 2 (Compliant)"
} 
