#!/bin/bash
set -x
# Delete adserver-p51s
sudo virsh destroy adserver-p51s
sudo virsh undefine adserver-p51s
sudo rm -f /var/lib/libvirt/images/adserver-p51s.x86_64.qcow2
sudo rm -f /var/lib/libvirt/images/adserver-wsus-p51s.x86_64.qcow2

