$Config = @{
    appVendor = "Adobe"
    appName = "Adobe Acrobat Reader DC"
    appVersion = "19.012.20034"
    appDetectionVersion = "19.012.20034"
    appDetectionName = "Adobe Acrobat Reader DC"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "AcroRd32"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] ��������� MSI ����� � ��������������..."
        $mainExitCode = Execute-MSI -Action 'Install' -Path 'AcroRead.msi' -Transform 'AcroRead.mst' -Parameters '/QN /norestart'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ��������� ��������� ������ ���������..."
        $mainExitCode = Execute-MSI -Action 'Patch' -Path 'AcroRdrDCUpd1901220034.msp' -Parameters '/QN /norestart'
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        $mainExitCode = Remove-MSIApplications -Name 'Adobe Acrobat Reader DC'
    }
}