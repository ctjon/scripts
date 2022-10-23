export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-fedora29 \
--description 'Fedora 29 Test System' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/test-fedora29.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant fedora29 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
