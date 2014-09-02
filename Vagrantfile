# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

vms = {
    "dev.covetel.com.ve" => "192.168.42.5",
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  vms.each do | name, ip |
    config.vm.define name do | machine |
      machine.vm.box = "debian7"
      machine.vm.box_check_update = false
      machine.vm.network "private_network", ip: ip
      machine.vm.hostname = name

      # This sections fail in Debian Wheezy, please report and solve.
      # Require nfs-kernel-server package in Debian
      machine.nfs.map_uid = 0
      machine.nfs.map_gid = 0

      machine.vm.synced_folder "../odoo", "/opt/odoo", nfs: true
      machine.vm.synced_folder "./addons", "/home/odoo/.local/share/OpenERP/addons/7.saas~5", nfs: true

      machine.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
        vb.customize ["modifyvm", :id, "--name", name ]
      end

      #machine.vm.provision "ansible" do |ansible|
      #  ansible.playbook = "provisioning/odoo.yml"
	  #  ansible.inventory_path = "provisioning/develop"
      #end
    end
  end
end
