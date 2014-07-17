#!/bin/bash

# var definitions - change depending on your infrastructure
MIRROR_IP=192.168.19.51
MIRROR_HOSTNAME=mirror
PORT=3142
DEB_MIRROR=$MIRROR_HOSTNAME:$PORT

# mirror ip address
sudo echo "$MIRROR_IP $MIRROR_HOSTNAME" >> /etc/hosts

#let's get the latest catalog of packages
sudo apt-get update

#let's get the latest version of software on the OS
sudo apt-get upgrade

# Installing packages
sudo apt-get -y --force-yes install postgresql libpq-dev libjpeg62-dev libpng++-dev python-dev libxml2-dev libxslt1-dev
sudo apt-get -y --force-yes install libldap2-dev libsasl2-dev libssl-dev
sudo apt-get -y --force-yes install python-pip
sudo apt-get -y --force-yes install python-dateutil python-decorator python-docutils python-feedparser python-gdata python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-pypdf python-reportlab python-requests python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi

# Odoo user (openerp)
sudo adduser --system --quiet --gecos 'Odoo user' --group openerp 
sudo chown openerp:openerp /opt/openerp
sudo sed -i 's#/home/openerp#/opt/openerp#g' /etc/passwd

## Odoo user in postgresql database
sudo su - postgres -c "createuser -s openerp" 2> /dev/null || true

## Creating log file
sudo mkdir -p /var/log/openerp/
sudo chown openerp:openerp /var/log/openerp
sudo chmod 0750 /var/log/openerp

## Creating local storage directory
sudo mkdir -p /var/lib/openerp/filestore
sudo chown openerp:openerp -R /var/lib/openerp

## Creating Odoo configurations folder
sudo mkdir -p /etc/openerp
sudo cp /opt/openerp/odoo/debian/openerp-server.conf /etc/openerp/
sudo chown -R openerp:openerp /etc/openerp/openerp-server.conf
sudo chmod 0750 /etc/openerp
sudo chmod 0640 /etc/openerp/openerp-server.conf

## Coping Odoo service 
sudo cp /opt/openerp/odoo/debian/openerp.init /etc/init.d/openerp
sudo chmod 755 /etc/init.d/openerp
sudo sed -i 's#DAEMON=/usr/bin/openerp-server#DAEMON=/opt/openerp/odoo/openerp-server#g' /etc/init.d/openerp

# sudo update-rc.d -f openerp enable

