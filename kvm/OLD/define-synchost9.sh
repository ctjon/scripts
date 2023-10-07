export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name synchost9 \
--description 'RHEL9-Synchost' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/synchost9.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel9.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--pxe 
