export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name synchost8-p51s \
--description 'RHEL8-Synchost-p51s' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/synchost8-p51s.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel8.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--pxe 
