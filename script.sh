#!/bin/bash 

# var definitions - change depending on your infrastructure
MIRROR_IP=192.168.113.238
MIRROR_HOSTNAME=mirror
PORT=3142
DEB_MIRROR=$MIRROR_HOSTNAME:$PORT

# mirror ip address
sudo echo "$MIRROR_IP $MIRROR_HOSTNAME" >> /etc/hosts

# apt sources
sudo echo "deb http://$DEB_MIRROR/ftp.debian.org/debian/ wheezy main contrib non-free" > /etc/apt/sources.list
sudo echo "deb http://$DEB_MIRROR/nightly.odoo.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list
sudo echo "deb http://$DEB_MIRROR/ftp.debian.org/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list

#let's get the latest catalog of packages
sudo apt-get -y --force-yes update
#let's get the latest version of software on the OS
sudo apt-get -y --force-yes upgrade 

# Install packages
sudo apt-get -y  --force-yes install less lsof screen
sudo apt-get -y --force-yes -t wheezy-backports install git

python /vagrant/odoo.py setup
