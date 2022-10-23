export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name VirtualPC-x1carbon \
--description 'Windows 11 VirtualPC on x1carbon' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/VirtualPC-x1carbon.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-type windows \
--os-variant win10 \
--graphics spice \
--boot uefi \
--network bridge=virbr0,model=virtio \
--sound ich9 \
--import --noautoconsole

#--network type=direct,source=eth0,source_mode=bridge,model=virtio \
#--network bridge=br0,model=virtio \
