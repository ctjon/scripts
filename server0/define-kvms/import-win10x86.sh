export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name win10x64 \
--description 'VirtualPC' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/win10x64.x86_64.qcow2 \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--import

#--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=ide \
