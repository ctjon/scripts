#!/bin/bash
export IP='172.16.1.30'
export MAC='52:54:00:00:00:30'

sudo cp /export/archive/Linux/RedHat/RHEL-8.8/x86_64/rhel-8.8-x86_64-kvm.qcow2 /var/lib/libvirt/images/test-rhel8.qcow2

sudo sudo virt-customize -a /var/lib/libvirt/images/test-rhel8.qcow2 \
--root-password password:pass1234 \
--hostname=test-rhel8 \
--uninstall cloud-init

virsh net-update default add ip-dhcp-host \
  "<host mac=$MAC ip=$IP />" \
   --live --config

export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-rhel8 \
--description 'TestVM-RHEL8' \
--ram 2048 \
--vcpus 1 \
--disk path=/var/lib/libvirt/images/test-rhel8.qcow2,size=512 \
--os-variant rhel8.8 \
--graphics vnc \
--network network=macvtap-bridge,model=virtio,mac=$MAC \
--boot hd,network,menu=on 

