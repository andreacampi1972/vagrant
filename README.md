# Vagrant Builds

To create a new Vagrant project use vagrant-ol8.

Modify config/server_configuration.yml

In this file
```
ip_number: 100
```
the ip_number variable is the latest octet XXX of 192.168.56.XXX/24 network.

The number 2XXX is the ssh forwarded_port.

For example: XXX=100 -> IP: 192.168.56.100 -> ssh forwarded port -> 2100

If you need to configure additional disk, you can add until 4 external disk image.

Uncomment and customize these parameters:
```
disk1_size: 150
disk1_device: /dev/sdb
disk1_mountpoint: '/var/lib/docker'
```


You can use personal public key

create config/ssh_connection.yml
```
ssh_public_key: '<path_to_your_public_key/your_public_key.pub>'
```



## Required Software

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## What is Vagrant?

If you don't know how to use Vagrant, you might want to read this introduction.

* [Vagrant : A Beginner's Guide](https://oracle-base.com/articles/vm/vagrant-a-beginners-guide)




## IP MAPPING
```
192.168.56.100  vagrant-ol8       2100

192.168.56.101  vagrant-ansible     2101

192.168.56.102  vagrant-docker      2102

192.168.56.102  vagrant-ubuntu      2103


192.168.56.104  vagrant-win2019      2104

```
