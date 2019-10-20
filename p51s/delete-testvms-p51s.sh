#!/bin/bash
set -x
# Delete centos6-test-p51s
sudo virsh destroy centos6-test-p51s
sudo virsh undefine centos6-test-p51s
sudo rm -f /var/lib/libvirt/images/centos6-test-p51s.x86_64.qcow2

# Delete centos7-test-p51s
sudo virsh destroy centos7-test-p51s
sudo virsh undefine centos7-test-p51s
sudo rm -f /var/lib/libvirt/images/centos7-test-p51s.x86_64.qcow2

# Delete fedora28-test-p51s
sudo virsh destroy fedora28-test-p51s
sudo virsh undefine fedora28-test-p51s
sudo rm -f /var/lib/libvirt/images/fedora28-test-p51s.x86_64.qcow2

# Delete fedora29-test-p51s
sudo virsh destroy fedora29-test-p51s
sudo virsh undefine fedora29-test-p51s
sudo rm -f /var/lib/libvirt/images/fedora29-test-p51s.x86_64.qcow2

# Delete rhel5-test-p51s
sudo virsh destroy rhel5-test-p51s
sudo virsh undefine rhel5-test-p51s
sudo rm -f /var/lib/libvirt/images/rhel5-test-p51s.x86_64.qcow2

# Delete rhel6-test-p51s
sudo virsh destroy rhel6-test-p51s
sudo virsh undefine rhel6-test-p51s
sudo rm -f /var/lib/libvirt/images/rhel6-test-p51s.x86_64.qcow2

# Delete rhel7-test-p51s
sudo virsh destroy rhel7-test-p51s
sudo virsh undefine rhel7-test-p51s
sudo rm -f /var/lib/libvirt/images/rhel7-test-p51s.x86_64.qcow2

# Delete rhel8-test-p51s
sudo virsh destroy rhel8-test-p51s
sudo virsh undefine rhel8-test-p51s
sudo rm -f /var/lib/libvirt/images/rhel8-test-p51s.x86_64.qcow2
