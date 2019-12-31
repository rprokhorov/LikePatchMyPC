$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "firefox"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] ��������� ����� ������ ��..."
        # ��������� ������ ���������� � �����������
        if ($Is64Bit)
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x64%" -Parameters "/INI=$dirFiles\Firefox.ini"
        }
        else
        {
            $mainExitCode = Execute-Process -Path "$dirFiles\%FileName_x86%" -Parameters "/INI=$dirFiles\Firefox.ini"
        }
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] ����������� ����� �������..."
		[string]$installPhase = 'Post-Installation'
        $FireFox_Folder = 'C:\Program Files\Mozilla Firefox'
        if(!(Test-Path -Path "$FireFox_Folder\distribution"))
        {
            New-Folder -Path "$FireFox_Folder\distribution"
        }
        Copy-File -Path "$dirSupportFiles\policies.json" -Destination "$FireFox_Folder\distribution\policies.json" -ContinueOnError $false 
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        Stop-Process -Name 'Firefox' -Force
		$mainExitCode = Execute-Process -Path "C:\Program Files\Mozilla Firefox\uninstall\helper.exe" -Parameters "/s"
    }
}