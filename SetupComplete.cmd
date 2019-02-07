REM Start FOG Service
sc config FOGService start= auto

REM Add Wireless configuration
netsh wlan add profile "C:\Windows\Setup\scripts\Config-ColonialProtectedNetwork.xml" user=all

REM Update all apps installed through choco
REM Chrome, Firefox, Backup&Sync, Flash, Reader, Java
choco upgrade all -y

REM Run Windows Update before finishing Deployment
powershell.exe c:\Windows\wupdate.ps1

REM Remove Unattend file
del /q /f c:\windows\system32\sysprep\unattend.xml

REM Restart to Finish
shutdown -t 0 -r