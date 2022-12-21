echo "******************************************************************************"
echo "Install custom packages " `date`
echo "******************************************************************************"

. sc.exe config winrm start= auto
iwr -useb https://chocolatey.org/install.ps1 | iex
choco install putty.install -y
choco install windirstat -y
choco install -y 7zip
choco install -y googlechrome
choco install -y notepadplusplus