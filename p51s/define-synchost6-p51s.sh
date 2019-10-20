export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name synchost6-p51s \
--description 'RHEL6-Synchost-p51s' \
--ram 1024 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/synchost6-p51s.x86_64.qcow2 \
--os-type linux \
--os-variant rhel6.10 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--import
