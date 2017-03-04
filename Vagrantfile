# -*- mode: ruby -*-
# vi: set ft=ruby :

#### MAKE SURE THESE ARE INSTALLED

# vagrant plugin install vagrant-vbguest
# vagrant plugin install vagrant-winnfsd

# To use Chef
# vagrant plugin install vagrant-librarian-chef
# vagrant plugin install vagrant-omnibus

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.memory = 4096
    vb.cpus = 4
    vb.gui = true
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  #config.ssh.username = 'vagrant'
  #config.ssh.password = 'vagrant'
  config.ssh.insert_key = true

  config.vm.network "private_network", ip: "192.168.222.30"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  #config.vm.network "public_network", ip: "192.168.1.59"

  # Match this to your home / work sybnet
  config.vm.network "public_network", ip: "192.168.58.59"

  # Forward ports
  config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", guest: 3306, host: 3306
  #config.vm.network "forwarded_port", guest: 3307, host: 3307

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3000, host: 80
  # Guardfile
  config.vm.network :forwarded_port, guest: 4000, host: 4000




  # This project folder
  config.vm.synced_folder ".", "/vagrant", id: 'vagrant', type: "nfs"
  # The rest of projects
  config.vm.synced_folder "C:/Projects", "/projects" ,id: 'projects',  type: "nfs"

  # Shared settings - later used in the setup file below
  config.vm.synced_folder "C:/Dropbox/Settings", "/settings" , id: 'settings',  type: "nfs"
  config.winnfsd.logging = "off"

  config.vm.provision :shell, path: "vagrant_config/apt_get_prerequisites.sh"
  #config.vm.provision :shell, path: "vagrant_config/app_specific_commands.sh"
  #config.vm.provision :shell, path: "vagrant_config/reset_passwords.sh"
end