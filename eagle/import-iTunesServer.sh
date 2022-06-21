export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--disk path=/dev/raid10vg/ituneslv \
--os-variant win10 \
--graphics vnc \
--sound ich9 \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--import

#--network network:macvtap-net,model=virtio \
