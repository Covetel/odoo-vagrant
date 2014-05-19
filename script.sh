#!/bin/bash 

# mirror ip address
sudo echo "10.0.2.2 mirror" >> /etc/hosts

# apt sources
sudo echo "deb http://mirror:3142/ftp.debian.org/debian/ wheezy main contrib non-free" > /etc/apt/sources.list
sudo echo "deb http://mirror:3142/nightly.openerp.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

# update
sudo apt-get update

# Install packages
sudo apt-get -y install debconf-utils less lsof screen vim git openerp

# Configs
rsync -av /vagrant/etc/ /etc/
