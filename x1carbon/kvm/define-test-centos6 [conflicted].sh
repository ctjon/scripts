export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-centos6 \
--description 'CentOS 6 Test System' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/test-centos6.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant centos6.10 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=e1000 \
--pxe 
