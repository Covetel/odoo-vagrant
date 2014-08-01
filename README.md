odoo-vagrant
============

Vagrant Setup for Odoo

Dependencies
------------

* VirtualBox
* Vagrant 1.6.1

Setup
-----

1. Download and install vagrant (the OR based wget allows COVETEL people to get it from a local mirror)

   ```
$ wget http://mirror/files/deb/vagrant_1.6.2_x86_64.deb || wget http://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
$ sudo dpkg -i vagrant_1.6.2_x86_64.deb

   ```

1. Setup vagrant box.

   ```
$ vagrant box add debian7 http://192.168.213.150/files/box/debian.box || vagrant box add debian7 http://iweb.dl.sourceforge.net/project/vagrantdebianboxes/debianwheezy.box

   ```
   
1. Clone this repository 

   ```
$ git clone https://github.com/Covetel/odoo-vagrant.git

   ```
1. Create `addons` directory

   ```
$ cd odoo-vagrant
$ mkdir ../addons
   ```
1. Edit file `script.sh` and set `$MIRROR_IP` to your IP address mirror.
1. Vagrant up

   ```
$ cd odoo-vagrant
$ vagrant up
   ```
