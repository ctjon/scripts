export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name centos7-test-p51s \
--description 'CentOS-7-Test-p51s' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/centos7-test-p51s.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant centos7.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--pxe 
