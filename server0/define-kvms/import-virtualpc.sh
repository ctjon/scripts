export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name virtualpc \
--description 'VirtualPC' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/virtualpc.x86_64.qcow2 \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--import
