
echo "******************************************************************************"
echo "Install base software" 
echo "******************************************************************************"


Install-WindowsFeature -name Telnet-Client


echo " Install the OpenSSH Client"
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

echo " Install the OpenSSH Server"
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0


echo "Start the sshd service"
Start-Service sshd

echo "sshd startup Automatic"
Set-Service -Name sshd -StartupType 'Automatic'

echo" Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify"
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}