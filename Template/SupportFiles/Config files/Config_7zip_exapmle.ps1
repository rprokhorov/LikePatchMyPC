$Config = @{
    appVendor = "Igor Pavlov"
    appName = "7-zip"
    appVersion = "19.00"
    appDetectionVersion = "19.00"
    appDetectionName = "7-zip"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "7zFM"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] �������� ������ ������..."
        try{
            Remove-MSIApplications -Name '7-zip'
            if (Test-Path -Path "C:\Program Files\7-Zip\Uninstall.exe")
            {
                Execute-Process -Path "C:\Program Files\7-Zip\Uninstall.exe"  -Parameters "/S" 
            }
        }
        catch{}
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ��������� ����� ������..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\7-zip-19.00_x64.msi" -Parameters '/qn'
        }
        else 
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\7-zip-19.00_x86.msi" -Parameters '/qn'
        }
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Remove-MSIApplications -Name '7-zip'
        if (Test-Path -Path "C:\Program Files\7-Zip\Uninstall.exe")
        {
            Execute-Process -Path "C:\Program Files\7-Zip\Uninstall.exe"  -Parameters "/S" 
        }
    }
}
