export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--disk path=/dev/ssdvg/ituneslv \
--os-variant win10 \
--graphics spice \
--sound ich9 \
--boot uefi \
--network bridge=br0,model=virtio \
--import --noautoconsole

#--boot hd,network,menu=on \
