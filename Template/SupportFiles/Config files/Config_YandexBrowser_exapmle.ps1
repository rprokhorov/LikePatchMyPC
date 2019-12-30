$Config = @{
    appVendor ="��� ������ѻ"
    appName = "Yandex.Browser"
    appVersion = "19.3.2.177"
    appDetectionVersion = "19.3.2.177"
    appDetectionName = "Yandex"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RPRokhorov"
    close_app = "browser"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\yandex_msi_19.10.3.177.msi" -Parameters '/qn'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Remove-MSIApplications -Name 'Yandex'
    }
}