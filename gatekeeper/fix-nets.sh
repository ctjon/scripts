#!/bin/bash
set -x

ifconfig -a
firewall-cmd --get-active-zones
firewall-cmd --remove-interface=eth0 --zone=public --perm
firewall-cmd --remove-interface=eth0 --zone=public 
firewall-cmd --get-active-zones
firewall-cmd --add-interface=eth0 --zone=trusted --perm
firewall-cmd --add-interface=eth0 --zone=trusted 
firewall-cmd --get-active-zones
firewall-cmd --reload
firewall-cmd --get-active-zones
cat /etc/sysconfig/network-scripts/ifcfg-eth0
cat /etc/sysconfig/network-scripts/ifcfg-eth1
