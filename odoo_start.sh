#!/bin/bash
NAME=openerp-server
DAEMON=/usr/bin/openerp-server
CONFIG=/vagrant/etc/openerp/openerp-server.conf
USER=openerp
LOGFILE=/vagrant/openerp-server.log

ARGS="$DAEMON --config $CONFIG --logfile $LOGFILE --update=$1"
CMD="sudo su $USER -s /bin/sh -c '$ARGS'"
vagrant ssh -c "$CMD"


