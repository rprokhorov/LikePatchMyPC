$Config = @{
    appVendor ="Martin Prikryl"
    appName = "WinSCP"
    appVersion = "5.15.9"
    appDetectionVersion = "5.15.9"
    appDetectionName = "WinSCP"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "WinSCP"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        $mainExitCode = Execute-Process -Path "$dirFiles\WinSCP-5.15.9.exe" -Parameters "/LANG=ru /VERYSILENT /NORESTART /LOG=""C:\Windows\Logs\Software\WinCSP-5.15.9_install.log"""
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files (x86)\WinSCP\unins000.exe" -Parameters "/VERYSILENT /LOG=""C:\Windows\Logs\Software\WinCSP-5.15.9_install.log"""
    }
}