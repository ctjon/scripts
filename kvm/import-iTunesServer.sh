export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--disk path=/dev/mediavg/ituneslv \
--os-variant win10 \
--graphics vnc \
--sound ich9 \
--boot uefi \
--network network=macvtap-bridge,model=e1000 \
--import --noautoconsole

#--boot hd,network,menu=on \
