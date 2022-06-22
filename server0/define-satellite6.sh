export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name satellite6 \
--description 'Satellite6' \
--ram 32768 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/satellite6.x86_64.qcow2,size=800 \
--os-type linux \
--os-variant rhel7.6 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe
