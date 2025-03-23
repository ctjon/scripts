export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install \
--name satclient0 \
--description 'Satellite Client 0' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/satclient0.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel6.10 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
