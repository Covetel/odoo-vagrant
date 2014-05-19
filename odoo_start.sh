#!/bin/bash
DAEMON=/usr/bin/openerp-server
CONFIG=/vagrant/etc/openerp/openerp-server.conf
USER=openerp

ARGS="$DAEMON --config $CONFIG"
CMD="sudo su $USER -s /bin/sh -c '$ARGS'"
vagrant ssh -c "$CMD"
