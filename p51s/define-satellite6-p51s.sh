export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name satellite6-p51s \
--description 'satellite6-p51s' \
--ram 16384 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/satellite6-p51s.x86_64.qcow2,size=300 \
--os-type linux \
--os-variant rhel7.6 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--pxe 
