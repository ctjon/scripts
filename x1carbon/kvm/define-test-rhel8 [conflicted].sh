export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-rhel8 \
--description 'RHEL-8.0-Test' \
--ram 2048 \
--vcpus 2 \
--disk path=/home/chris/VirtualMachines/test-rhel8.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel8.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
#--disk path=/var/lib/libvirt/images/test-rhel8.x86_64.qcow2,size=20 \
