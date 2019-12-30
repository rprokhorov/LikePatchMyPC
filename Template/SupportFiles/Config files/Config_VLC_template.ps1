$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptAuthor = "RProkhorov"
    close_app = "vlc"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/2] ��������� ����������..." #-WindowLocation 'BottomRight'
        # ��������� MSI ����� � �����������
        if ($Is64Bit)
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x64%" -Parameters '/qn' -Transform "$dirFiles\diff.mst"
        }
        else 
        {
            $mainExitCode = Execute-MSI -Action 'Install' -Path "$dirFiles\%FileName_x86%" -Parameters '/qn' -Transform "$dirFiles\diff.mst"
        }
        [string]$installPhase = 'Post-Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [2/2] �������� ������ � �������� �����..." #-WindowLocation 'BottomRight'
        Remove-Item "$env:SystemDrive\Users\Public\Desktop\VLC media player.lnk" -Force
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
	$mainExitCode = Remove-MSIApplications -Name 'VLC'
    }
}