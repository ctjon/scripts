export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer11 \
--description 'iTunesServer11' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer11.qcow2,size=60 \
--disk path=/export/archive/Windows/Microsoft/Windows11/Win11_English_x64v1.iso,device=cdrom,bus=sata \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-variant win10 \
--graphics spice \
--sound ich9 \
--boot uefi \
--network bridge=br0,model=virtio \
--import

#--disk path=/dev/raid10vg/ituneslv \
#--boot hd,network,menu=on \
