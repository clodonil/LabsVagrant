#!/bin/bash

RC=1

#copiar o VagrantFile
cp /vagrant/runner/Vagrantfile  .

#Up da VM
vagrant up --provider=libvirt

# Verificar o status do apply

if [ $? == "0" ]; then
  RC=0
fi
# Destruindo a VM
#vagrant destroy -f

#Return code
exit $RC
