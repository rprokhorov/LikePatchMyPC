$Config = @{
    appVendor ="dotPDN LLC"
    appName = "paint.net"
    appVersion = "4.2"
    appDetectionVersion = "4.2"
    appDetectionName = "paint.net"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "PaintDotNet"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
		Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ����� ������ ��..."
		$mainExitCode = Execute-Process -Path "$dirFiles\PaintDotNet_x64.msi"  -Parameters "/verysilent"
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
		$mainExitCode = Remove-MSIApplications -Name 'paint.net'
    }
}