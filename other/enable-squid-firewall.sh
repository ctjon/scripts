#!/bin/bash
firewall-cmd --zone=trusted --list-all
firewall-cmd --permanent --zone=trusted --add-forward-port=port=80:proto=tcp:toport=3128:toaddr=172.16.1.1 --perm
firewall-cmd --add-port=3128/tcp --zone=trusted --perm
firewall-cmd --add-port=3129/tcp --zone=trusted --perm
firewall-cmd --reload
firewall-cmd --zone=trusted --list-all

