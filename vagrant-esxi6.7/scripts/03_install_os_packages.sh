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
groupadd -g 1042 docker_fg
useradd -G docker_fg docker_user


echo "docker_user  ALL=(ALL)  NOPASSWD: /usr/bin/docker" >> /etc/sudoers
echo "alias docker=\"sudo /usr/bin/docker\"" >> /home/docker_user/.bash_profile

echo "******************************************************************************"
echo "Configure docker-compose." `date`
echo "******************************************************************************"
curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "docker_user  ALL=(ALL)  NOPASSWD: /usr/local/bin/docker-compose" >> /etc/sudoers
echo "alias docker-compose=\"sudo /usr/local/bin/docker-compose\"" >> /home/docker_user/.bash_profile
