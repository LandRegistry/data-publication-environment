# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "landregistry/centos-beta"
  config.vm.box = "landregistry/centos"
  config.vm.box_version      = "0.3.0"

  config.ssh.forward_agent = true

  config.vm.provision :shell, :path => 'scripts/provision.sh'

  config.vm.network :forwarded_port, host: 5000, guest: 5000
end
