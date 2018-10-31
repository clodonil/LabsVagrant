#!/bin/bash

PE="puppet-enterprise-*.tar.gz"

systemctl stop firewalld
systemctl disable firewalld

tar -xzvf /vagrant/PuppetServer/$PE -C /usr/local/src/
ln -s /usr/local/src/puppet-enterprise* /usr/local/src/pe

/usr/local/src/pe/puppet-enterprise-installer -c /vagrant/PuppetServer/pe.conf

/opt/puppetlabs/bin/puppet agent -t
/opt/puppetlabs/bin/puppet agent -t


#autosign
echo "autosign = true" >> /etc/puppetlabs/puppet/puppet.conf
echo "*.infra.vm"      >  /etc/puppetlabs/puppet/autosign.conf
systemctl reload pe-puppetserver


#Download do modulo do GitLab
puppet module install puppet-gitlab --version 2.1.0


#r10k
mkdir /etc/puppetlabs/puppetserver/ssh
ssh-keygen -t rsa -b 2048 -P '' -f /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa