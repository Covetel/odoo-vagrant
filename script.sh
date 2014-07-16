#!/bin/bash

# var definitions - change depending on your infrastructure
MIRROR_IP=10.0.2.2
MIRROR_HOSTNAME=mirror
PORT=3142
DEB_MIRROR=$MIRROR_HOSTNAME:$PORT

# mirror ip address
sudo echo "$MIRROR_IP $MIRROR_HOSTNAME" >> /etc/hosts

# apt sources
sudo echo "deb http://$DEB_MIRROR/ftp.debian.org/debian/ wheezy main contrib non-free" > /etc/apt/sources.list
sudo echo "deb http://$DEB_MIRROR/nightly.odoo.com/7.0/nightly/deb/ ./" >> /etc/apt/sources.list

#let's get the latest catalog of packages
sudo apt-get update
#let's get the latest version of software on the OS
sudo apt-get upgrade

sudo apt-get -y --force-yes install postgresql libpq-dev libjpeg62-dev libpng++-dev python-dev libxml2-dev libxslt1-dev
sudo apt-get -y --force-yes install libldap2-dev libsasl2-dev libssl-dev
sudo apt-get -y --force-yes install python-pip
sudo pip install virtualenv -q
sudo pip install virtualenvwrapper -q

# Odoo user (openerp)
sudo adduser --system --quiet --gecos 'Odoo' --home=/opt/openerp --group openerp

# Odoo user in postgresql database
sudo su - postgres -c "createuser -s openerp" 2> /dev/null || true
sudo chown openerp:openerp /etc/openerp/openerp-server.conf
sudo chmod 0640 /etc/openerp/openerp-server.conf
# Creating log file
sudo mkdir -p /var/log/openerp/
sudo chown openerp:openerp /var/log/openerp
sudo chmod 0750 /var/log/openerp
# Creating local storage directory
sudo mkdir -p /var/lib/openerp/filestore
sudo chown openerp:openerp -R /var/lib/openerp

# Creating Odoo configurations folder
sudo mkdir -p /etc/openerp
sudo chown openerp:openerp /etc/openerp
sudo chmod 0750 /etc/openerp
sudo cp /opt/openerp/odoo/debian/openerp-server.conf /etc/openerp/

# Coping Odoo service 
sudo cp /opt/openerp/odoo/debian/openerp.init /etc/init.d/openerp
sudo chmod 755 /etc/init.d/openerp
sudo sed -i 's#DAEMON=/usr/bin/openerp-server#DAEMON=/opt/openerp/odoo/openerp-server#g' /etc/init.d/openerp
sudo sed -i 's#PATH=#PATH=/opt/openerp/.virtualenvs/odoo8/bin:#g' /etc/init.d/openerp
# sudo update-rc.d -f openerp enable

# installing all the software odoo use in enviroment 
# source /usr/local/bin/virtualenvwrapper.sh
# mkvirtualenv odoo8
# workon odoo8
# sudo pip install -r requirements.txt -q

