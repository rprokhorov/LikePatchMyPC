$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "7zFM"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] �������� ������ ������..."
        Remove-MSIApplications -Name '7-zip'
        if (Test-Path -Path "C:\Program Files\7-Zip\Uninstall.exe")
        {
            Execute-Process -Path "C:\Program Files\7-Zip\Uninstall.exe"  -Parameters "/S" 
        }
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ��������� ����� ������..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x64%" -Parameters '/qn'
        }
        else 
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x86%" -Parameters '/qn'    
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