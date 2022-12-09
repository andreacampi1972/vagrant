echo "******************************************************************************"
echo "Install custom packages " `date`
echo "******************************************************************************"


dnf install -y oraclelinux-developer-release-el8.x86_64
dnf install -y python38-pip sshpass git-svn
dnf install -y squid

#Install vmware
pip3.8 install requests pyVim PyVmomi pywinrm ansible oci-cli
