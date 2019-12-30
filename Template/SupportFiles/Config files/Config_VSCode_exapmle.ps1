$Config = @{
    appVendor ="Microsoft"
    appName = "Visual Studio Code"
    appVersion = "1.36.1"
    appDetectionVersion = "1.36.1"
    appDetectionName = "Visual Studio Code"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "Code"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
        if ($Is64Bit)
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\VSCodeSetup-x64-1.36.1.exe"  -Parameters "/verysilent /norestart /mergetasks=!runcode"
        }
        else 
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\VSCodeSetup-x86-1.36.1.exe"  -Parameters "/verysilent /norestart /mergetasks=!runcode"
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files\Microsoft VS Code\unins000.exe"  -Parameters "/verysilent /norestart /closeapplications"
    }
}