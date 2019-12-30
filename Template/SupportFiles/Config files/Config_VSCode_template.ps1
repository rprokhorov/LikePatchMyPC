$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "Code"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x64%"  -Parameters "/verysilent /norestart /mergetasks=!runcode"
        }
        else 
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x86%"  -Parameters "/verysilent /norestart /mergetasks=!runcode"
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files\Microsoft VS Code\unins000.exe"  -Parameters "/verysilent /norestart /closeapplications"
    }
}