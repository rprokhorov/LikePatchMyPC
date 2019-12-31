$Config = @{
    appVendor = "Microsoft"
    appName = "Remote Desktop Connection Manager"
    appVersion = "2.7.14060"
    appDetectionVersion = "2.7.14060"
    appDetectionName = "Remote Desktop Connection Manager"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "RDCMan"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\rdcman-2.7.14060.msi" -Parameters '/QN /norestart'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		Remove-MSIApplications -Name 'Remote Desktop Connection Manager'
    }
}