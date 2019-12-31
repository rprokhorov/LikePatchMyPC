$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "far"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] �������� ������ ������ ����������..."
        Remove-MSIApplications -Name 'Far Manager'
        if ($envOSArchitecture = '64-bit'){
            Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ��������� ����� ������ ����������..."
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x64%" -Parameters '/QN /norestart'
        }
        else {
            Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ��������� ����� ������ ����������..."
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x86%" -Parameters '/QN /norestart'
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Remove-MSIApplications -Name 'Far Manager'
    }
}