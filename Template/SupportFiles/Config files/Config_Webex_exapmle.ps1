$Config = @{
    appVendor ="Cisco Webex LLC"
    appName = "Cisco Webex Meetings"
    appVersion = "39.9.4.141"
    appDetectionVersion = "39.9.4.141"
    appDetectionName = "Cisco Webex Meetings"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "webexmta"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\webexapp.msi" -Parameters '/qn'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        $mainExitCode = Remove-MSIApplications -Name 'Cisco Webex Meetings'
    }
}