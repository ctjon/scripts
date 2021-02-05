export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--os-type windows \
--os-variant win10 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=e1000 \
--import

