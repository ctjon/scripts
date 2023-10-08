export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name satellite6 \
--description 'Satellite6-RHEL8' \
--ram 24576 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/satellite6.qcow2,size=512 \
--disk path=/export/archive/Linux/RedHat/Satellite/Satellite-6.13.4-rhel-8-x86_64.dvd.iso,device=cdrom \
--os-variant rhel8.8 \
--graphics spice \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe

