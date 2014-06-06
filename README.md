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
$ wget http://mirror/files/deb/vagrant_1.6.2_x86_64.deb
$ sudo dpkg -i vagrant_1.6.2_x86_64.deb
```

1. Download odoo debian package
	``` 
$ cd odoo-vagrant
$ wget -c http://nightly.openerp.com/trunk/nightly/deb/openerp_8.0dev-20140416-230101-1_all.deb
$ mkdir package
$ mv openerp_8.0dev-20140416-230101-1_all.deb package
``` 

1. Setup vagrant box.

	```
$ vagrant box add debian7 http://192.168.213.150/files/box/debian.box
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
