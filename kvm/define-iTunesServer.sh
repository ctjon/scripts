#
# I only have windows 8 keys so I install windows 8 and then upgrade to 11
#
export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer11' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2,size=60 \
--disk path=/export/archive/Windows/Microsoft/Windows10/Win10_22H2_English_x64v1.iso,device=cdrom,bus=sata \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-variant win10 \
--graphics vnc \
--sound ich9 \
--boot uefi \
--network network:macvtap-bridge,model=e1000 

#--network bridge=br0,model=virtio \
#--disk path=/dev/raid10vg/ituneslv \
#--boot hd,network,menu=on \
#--disk path=/export/archive/Windows/Microsoft/Windows11/x86_64/Win11_23H2_English_x64.iso,device=cdrom,bus=sata \
#--os-variant win10 \
