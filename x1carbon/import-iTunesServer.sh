export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--disk path=/dev/mediavg/ituneslv \
--os-variant win10 \
--graphics spice \
--sound ich9 \
--boot uefi \
--network type=direct,source=eth0,source_mode=bridge,model=virtio \
--network bridge=virbr0,model=virtio \
--import --noautoconsole

#--boot hd,network,menu=on \
#--network bridge=br0,model=virtio \
