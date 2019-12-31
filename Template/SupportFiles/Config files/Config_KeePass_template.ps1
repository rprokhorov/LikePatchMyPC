$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "keepass"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        Remove-MSIApplications -Name "KeePass"
        $mainExitCode = Execute-MSI -Action "Install" -Path "$dirFiles\%FileName%" -Parameters "/QN /norestart"
        [string]$installPhase = 'Post-Installation'
        Copy-File -Path "\\srv0101-sccm01.ak.tn.corp\Sources\Applications\KeePass\Config files\KeePass.config.xml" -Destination "C:\Program Files (x86)\KeePass2x\KeePass.config.xml" -ContinueOnError $false
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Remove-MSIApplications -Name 'KeePass'
    }
}