#!/bin/bash
NAME=openerp-server
DAEMON=/opt/odoo/openerp-server
CONFIG=/etc/openerp/openerp-server.conf
USER=openerp

ARGS="$DAEMON --config $CONFIG --update=$1"
CMD="sudo su $USER -s /bin/sh -c '$ARGS'"
vagrant ssh -c "$CMD"
