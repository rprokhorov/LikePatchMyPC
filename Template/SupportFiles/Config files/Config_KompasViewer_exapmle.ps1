$Config = @{
    appVendor = "�����"
    appName = "������-3D Viewer"
    appVersion = "18.1.10"
    appDetectionVersion = "18.1.10"
    appDetectionName = "������-3D Viewer"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "kViewer"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����������..." #-WindowLocation 'BottomRight'
        if($envOSArchitecture -eq '64-bit')
		{
			$mainExitCode = Execute-MSI -Action "Install" -Path "$dirFiles\x64\KOMPAS-3D_Viewer_v18_1_x64.msi" -Parameters "/QN /norestart"
		}
		else {
			$mainExitCode = Execute-MSI -Action "Install" -Path "$dirFiles\x86\KOMPAS-3D_Viewer_v18_1_x86.msi" -Parameters "/QN /norestart"
		}
        
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        $mainExitCode = Remove-MSIApplications -Name '������-3D Viewer'
    }
}