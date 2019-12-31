$Config = @{
    appVendor = "%Publisher%"
    appName = "%appName%"
    appVersion = "%appVersion%"
    appDetectionVersion = "%appDetectionVersion%"
    appDetectionName = "%appDetectionName%"
    appScriptDate = get-date -Format "yyyy/MM/dd"
    appScriptAuthor = "RProkhorov"
    close_app = "FAXCTRL"
    InstallScriptBlock = {
        [string]$installPhase = 'Installation'
        $Domain = (Get-WmiObject Win32_ComputerSystem).Domain
        $FaxServer = @{
            'a.contoso.com' = 'srv.a.contoso.com'
            'b.contoso.com' = 'srv.b.contoso.com'
        }
        # �������� ���������� ADDLOCAL="FaxUtil,FaxCtrl,EFM,Outlook"
        # FaxUtil -�������� ������� ��� ������������
        # FaxCtrl - ������� ��������������
        # EFM - ��
        # Outlook - ������
        Show-InstallationProgress -StatusMessage "��������� ���������� $appName `n��� [1/1] ��������� ���������� ..."
        $mainExitCode = Execute-Process -Path "$dirFiles\%FileName%" -Parameters "/unattended=true /allowShutdown=true /add=FaxCtrl /drop=Outlook /rightFaxServer=$($FaxServer[$Domain])"
        # ��� ��� ���������� ����� ���������� ��� 0, �� ����� ������� �������� �� ����� ���������
        Start-Sleep 60
    }
    UninstallScriptBlock = {
        [string]$installPhase = 'Uninstall'
        $mainExitCode = Execute-Process -Path "$dirFiles\%FileName%" -Parameters "/remove /unattended=true /allowShutdown=true"
        # ��� ��� ���������� ����� ���������� ��� 0, �� ����� ������� �������� �� ����� ���������
        Start-Sleep 60
    }
}
