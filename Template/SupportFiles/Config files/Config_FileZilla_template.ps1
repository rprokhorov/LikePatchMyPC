$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "filezilla"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..." #-WindowLocation 'BottomRight'
        $mainExitCode = Execute-Process -Path "$dirFiles\%FileName%"  -Parameters "/S /user=all"
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        $mainExitCode = Execute-Process -Path "C:\Program Files\FileZilla FTP Client\uninstall.exe"  -Parameters "/S"
    }
}