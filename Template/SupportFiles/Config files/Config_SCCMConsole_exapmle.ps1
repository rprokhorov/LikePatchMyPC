$Config = @{
    appVendor = "Microsoft"
    appName = "SCCM Console"
    appVersion = "1902 (5.1902.1085.1000)"
    appDetectionVersion = "5.1902.1085.1000"
    appDetectionName = "System Center Configuration Manager Console"
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