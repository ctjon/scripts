#!/bin/bash
set -x
sudo firewall-cmd --remove-service=ssh --zone=public --perm
sudo firewall-cmd --reload
sudo firewall-cmd --list-services --zone=public
