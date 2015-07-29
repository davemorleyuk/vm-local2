# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = 'mobileoverlord/centos-6.5'
HOSTNAME = 'local2'
DOMAIN = 'd'
IP = '192.168.56.3'
RAM = '512'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.box = BOX
	config.vm.hostname = HOSTNAME +  '.' + DOMAIN

	config.vm.network :private_network, ip: IP
	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 3306, host: 33003
	config.vm.synced_folder "../../projects", "/home/projects"	

	config.vm.provision :chef_solo do |chef|
		chef.roles_path = "./chef/roles"
		chef.cookbooks_path = ["./chef/cookbooks-custom", "./chef/cookbooks"]
		chef.add_role "vagrant-dev-box"
	end

end