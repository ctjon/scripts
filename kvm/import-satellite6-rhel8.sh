export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name satellite6-rhel8 \
--description 'Satellite6-RHEL8' \
--ram 24576 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/satellite6.qcow2 \
--disk path=/export/archive/Linux/RedHat/Satellite/satellite-6.13.0-rhel-7-x86_64-dvd.iso,device=cdrom \
--os-variant rhel8.8 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=e1000e \
--import --noautoconsole

