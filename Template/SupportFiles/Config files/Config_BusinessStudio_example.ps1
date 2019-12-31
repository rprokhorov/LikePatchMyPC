$Config = @{
    appVendor = "�� ���"
    appName = "Business Studio"
    appVersion = "4.2.6400"
    appDetectionVersion = "4.2.6400"
    appDetectionName = "Business Studio"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "Business Studio Enterprise"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ����������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\package\package.msi" -Parameters '/q CFG_CLIENT=1 CFG_ENT=1'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Remove-MSIApplications -Name 'Business Studio'
    }
}