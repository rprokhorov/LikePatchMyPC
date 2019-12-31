$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "mRemoteNG"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
		$mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName%" -Parameters '/QN /norestart'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Remove-MSIApplications -Name 'mRemoteNG'
    }
}