$Config = @{
    appVendor = "Microsoft"
    appName = "Microsoft Power BI Desktop RS"
    appVersion = "2.73.5586.821 (2019.09)"
    appDetectionVersion = "2.73.5586.821"
    appDetectionName = "Microsoft Power BI Desktop"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "PBIDesktop"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\PBIDesktopRS_x64.msi" -Parameters '/QN /norestart ACCEPT_EULA=1'
        }
        else 
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\PBIDesktopRS.msi" -Parameters '/QN /norestart ACCEPT_EULA=1'
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		Remove-MSIApplications -Name 'Microsoft Power BI Desktop'
    }
}