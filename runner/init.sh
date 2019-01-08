#!/bin/bash


# Install 
yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm
yum install -y gcc ruby-devel libvirt-devel libvirt
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-puppet-install



#Sudoers
/etc/sudoers 
echo "Defaults:gitlab-runner  !requiretty"  >> /etc/sudoers
echo "gitlab-runner  ALL=(ALL)  NOPASSWD:ALL" >> /etc/sudoers


curl -k https://master.infra.vm:8140/packages/current/install.bash | sudo bash"
