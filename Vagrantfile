# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_VERSION = 2

Vagrant.configure(VAGRANT_VERSION) do |config|

  config.vm.define "odoo" do |odoo|
    
    odoo.vm.synced_folder "../addons", "/home/vagrant/addons"

    odoo.vm.box = "debian7"
    odoo.vm.host_name = "odoo-dev-8"
    
    odoo.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--name", "odoo-dev-8" ]
    end

    odoo.vm.network :forwarded_port, guest: 8070, host: 8070

  end

  config.vm.provision "shell", path: "script.sh"

end
