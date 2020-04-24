#!/bin/bash
export PUBLIC_INTERFACE=eth1
export RECIPIENT=user@example.com

/usr/sbin/ifconfig $PUBLIC_INTERFACE|grep inet|awk '{print $2}'|mail -s "IP for `date +%D`" $RECIPIENT


