$Config = @{
    appVendor = "Microsoft"
    appName = "Microsoft Message Analyzer"
    appVersion = "4.0.8112.0"
    appDetectionVersion = "4.0.8112.0"
    appDetectionName = "Microsoft Message Analyzer"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = ""
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\MessageAnalyzer64.msi" -Parameters "/qn"
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		Remove-MSIApplications -Name 'Microsoft Message Analyzer'
    }
}