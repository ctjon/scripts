#!/bin/bash
export IP='172.16.1.38'
export MAC='52:54:00:00:00:38'

sudo cp /export/archive/Linux/Fedora/38/x86_64/Fedora-Server-KVM-38-1.6.x86_64.qcow2 /var/lib/libvirt/images/test-fedora38.qcow2

sudo sudo virt-customize -a /var/lib/libvirt/images/test-fedora38.qcow2 \
--root-password password:pass1234 \
--hostname=test-fedora38 \
--uninstall cloud-init

export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-fedora38 \
--description 'Test-Fedora38' \
--ram 2048 \
--vcpus 1 \
--disk path=/var/lib/libvirt/images/test-fedora38.qcow2,size=512 \
--os-variant fedora37 \
--graphics vnc \
--network network:macvtap-bridge,model=virtio \
--boot hd,network,menu=on 

#--network bridge=br0,model=virtio,mac='52:54:00:00:00:38' \
