#!/bin/bash
firewall-cmd --zone=trusted --list-all
firewall-cmd --remove-forward-port='port=80:proto=tcp:toport=3128:toaddr=172.16.1.1' --zone=trusted --perm
firewall-cmd --reload
firewall-cmd --zone=trusted --list-all
