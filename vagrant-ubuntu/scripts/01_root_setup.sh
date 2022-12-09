# Base installation.

echo "******************************************************************************"
echo "Configure Disk" `date`
echo "******************************************************************************"

if [ -f /vagrant/scripts/02_prepare_disks.sh ]; then
    bash /vagrant/scripts/02_prepare_disks.sh
fi



echo "******************************************************************************"
echo "Install base software" `date`
echo "******************************************************************************"

#dnf install -y vim bind-utils git telnet nc lsof vim tar gpm unzip bzip2 dnf-utils
#dnf install -y net-tools tcpdump wget sg3_utils rsync mailx


if [ -f /vagrant/scripts/03_install_os_packages.sh ]; then
    bash /vagrant/scripts/03_install_os_packages.sh
fi

if [ -f /vagrant/scripts/04_private_customization.sh ]; then
    bash /vagrant/scripts/04_private_customization.sh
fi
