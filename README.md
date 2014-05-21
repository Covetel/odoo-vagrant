odoo-vagrant
============

Vagrant Setup for Odoo

Dependencies
------------

* VirtualBox
* Vagrant 1.6.1

Setup
-----

1. Download and install vagrant

   ```
wget http://mirror/files/deb/vagrant_1.6.2_x86_64.deb
sudo dpkg -i vagrant_1.6.2_x86_64.deb
```
1. Setup vagrant box.
	```
vagrant box add debian7 http://192.168.213.150/files/box/debian.box
```
