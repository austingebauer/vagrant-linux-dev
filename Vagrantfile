# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Complete reference documentation at https://docs.vagrantup.com.

  # Ubuntu 16.04 LTS from https://app.vagrantup.com/ubuntu/boxes/xenial64
  config.vm.box = "ubuntu/xenial64"

  # Provisioning Scripts
  config.vm.provision :shell, path: "bootstrap.sh"
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # Enable automatic box update checking
  config.vm.box_check_update = true

  # Virtualbox specific configuration
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "1024"
     vb.cpus = 2
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "/Users/gebauer/Desktop/nginx", "/home/vagrant/nginx", owner: "vagrant", group: "vagrant"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
end
