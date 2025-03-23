export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install \
--name test-rhel7 \
--description 'RHEL-7.6-Test' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/test-rhel7.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel7.6 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
