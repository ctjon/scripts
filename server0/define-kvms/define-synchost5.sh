export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name synchost5 \
--description 'RHEL5-Synchost' \
--ram 1024 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/synchost5.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel5.11 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=e1000 \
--pxe
