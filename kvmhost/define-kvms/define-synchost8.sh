export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name synchost8 \
--description 'RHEL8-Synchost' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/synchost8.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel8.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe
