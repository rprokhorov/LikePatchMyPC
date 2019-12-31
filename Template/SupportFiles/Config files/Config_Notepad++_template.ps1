$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "Notepad++"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x64%"  -Parameters "/S"
        }
        else 
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x86%"  -Parameters "/S"
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files\Notepad++\uninstall.exe" -Parameters "/S"
    }
}