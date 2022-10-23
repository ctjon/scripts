export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name test-fedora30 \
--description 'Fedora 30 Test System' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/test-fedora30.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant fedora30 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
