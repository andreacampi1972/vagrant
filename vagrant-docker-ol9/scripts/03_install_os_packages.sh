

echo "******************************************************************************"
echo "Install Docker." `date`
echo "******************************************************************************"
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce --nobest
#yum update -y

echo "******************************************************************************"
echo "Enable Docker." `date`
echo "******************************************************************************"
systemctl enable docker.service
systemctl start docker.service
systemctl status docker.service

echo "******************************************************************************"
echo "Create non-root docker user." `date`
echo "******************************************************************************"

useradd -u 1000 -g docker docker


#echo "docker  ALL=(ALL)  NOPASSWD: /usr/bin/docker" >> /etc/sudoers
#echo "alias docker=\"sudo /usr/bin/docker\"" >> /home/docker/.bash_profile

echo "******************************************************************************"
echo "Configure docker-compose." `date`
echo "******************************************************************************"
curl -L -o /usr/local/bin/docker-compose \
     $(curl --silent --show-error \
            https://api.github.com/repos/docker/compose/releases/latest \
            | grep -i 'Linux-x86_64"' \
            | grep url \
            | cut --delimiter='"' --fields=4 \
     ) && \
chmod +x /usr/local/bin/docker-compose

echo "docker  ALL=(ALL)  NOPASSWD: /usr/local/bin/docker-compose" >> /etc/sudoers
echo "alias docker-compose=\"sudo /usr/local/bin/docker-compose\"" >> /home/$docker_user/.bash_profile
