#!/usr/bin/env bash

sudo apt-get update 
sudo apt-get upgrade -y 

sudo adduser --system --quiet --gecos 'OpenERP' --group openerp
sudo chown -R openerp:openerp /home/openerp

sudo aptitude install -y postgresql-9.1
sudo dpkg -i package/openerp_8.0dev-20140416-230101-1_all.deb
sudo aptitude install -y openerp

sudo apt-get install -y --force-yes git vim tmux less lsof openerp

sudo service openerp stop
sudo update-rc.d -f openerp disable
