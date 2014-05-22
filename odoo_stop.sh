#!/bin/sh
vagrant ssh -c "sudo ps ax | grep openerp-server | cut -d ' ' -f 1| tr '\n' ' ' | xargs sudo kill"
