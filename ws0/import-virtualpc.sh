export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name VirtualPC \
--description 'Windows 11 VirtualPC' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/VirtualPC.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-type windows \
--os-variant win10 \
--graphics spice \
--boot uefi \
--network type=direct,source=eth0,source_mode=bridge,model=virtio \
--network bridge=virbr0,model=virtio \
--sound ich9 \
--import --noautoconsole

#--network bridge=br0,model=virtio \
