export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name adserver \
--description 'Windows 2012 AD Server' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/adserver.x86_64.qcow2 \
--disk path=/var/lib/libvirt/images/adserver-wsus.x86_64.qcow2 \
--os-type windows \
--os-variant win2k12 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=e1000 \
--import
