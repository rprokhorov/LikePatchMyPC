$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "WinSCP"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-Process -Path "$dirFiles\%FileName%" -Parameters "/LANG=ru /VERYSILENT /NORESTART /LOG=""C:\Windows\Logs\Software\WinCSP-%appVersion%_install.log"""
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files (x86)\WinSCP\unins000.exe" -Parameters "/VERYSILENT /LOG=""C:\Windows\Logs\Software\WinCSP-%appVersion%_install.log"""
    }
}