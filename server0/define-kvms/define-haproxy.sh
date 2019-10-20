export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name haproxy \
--description 'HA Proxy Server' \
--ram 2048 \
--vcpus 2 \
--disk path=/var/lib/libvirt/images/haproxy.x86_64.qcow2,size=20 \
--os-type linux \
--os-variant rhel8.0 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--pxe 
