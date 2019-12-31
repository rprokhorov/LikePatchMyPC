$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "Microsoft.ConfigurationManagement"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
        Execute-Process -Path "ConsoleSetup.exe"  -Parameters '/q TargetDir="C:\Program Files\ConfigMgr Console" DefaultSiteServerName=SCCMServer.contoso.com'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Execute-Process -Path "ConsoleSetup.exe"  -Parameters "/uninstall /q" 
    }
}