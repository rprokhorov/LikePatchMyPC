$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RPRokhorov"
    close_app = "Wireshark"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..."
        if ($envOSArchitecture = '64-bit'){
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x64%"  -Parameters "/S /desktopicon=yes"
        }
        else {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x86%"  -Parameters "/S /desktopicon=yes"
        }
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Execute-Process -Path "C:\Program Files\Wireshark\uninstall.exe"  -Parameters "/S"
    }
}