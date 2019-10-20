export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name fedora29-test-p51s \
--description 'Fedora-29-Test-p51s' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/fedora29-test-p51s.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant fedora29 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--pxe 
