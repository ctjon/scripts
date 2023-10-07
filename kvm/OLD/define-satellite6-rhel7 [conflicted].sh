export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name satellite6-rhel7 \
--description 'Satellite6-RHEL7' \
--ram 24576 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/satellite6-rhel7.x86_64.qcow2,size=800 \
--disk path=/export/archive/Linux/RedHat/Satellite/satellite-6.11.0-rhel-7-x86_64-dvd.iso,device=cdrom \
--os-variant rhel7.9 \
--graphics spice \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe

