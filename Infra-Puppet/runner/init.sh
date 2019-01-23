#!/bin/bash


# Install 
yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm
yum -y install gcc ruby-devel libvirt-devel libvirt git 
rpm -ivh https://yum.puppet.com/puppet5/el/7/x86_64/pdk-1.8.0.0-1.el7.x86_64.rpm

# Ruby 2.3
yum -y install centos-release-scl
yum-config-manager --enable rhel-server-rhscl-7-rpms
yum  -yinstall rh-ruby23
scl enable rh-ruby23 bash
gem install bundler
gem install optimist
gem install facter
gem install puppet-retrospec


echo "scl enable rh-ruby23 bash" > /etc/profile.d/ruby23.sh

# Install vagrant com libvirt
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-puppet-install



#Sudoers
#/etc/sudoers 
echo 'Defaults:gitlab-runner  !requiretty'  >> /etc/sudoers
echo 'gitlab-runner  ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers


curl -k https://master.infra.vm:8140/packages/current/install.bash | sudo bash"

mkdir /opt/puppetlabs/tools/
cp /vagrant/runner/apply.sh /opt/puppetlabs/tools/
chmod +x /opt/puppetlabs/tools/apply.sh

# Execute o comando 

echo "id_rsa" |  ssh-keygen -t rsa -N ""
#ssh-keygen
#Copie o conteúdo do id_rsa.pub para o host do KVM no arquivo ~/.ssh/authorized_keys
#ssh-copy-id clodonil@192.168.77.1
