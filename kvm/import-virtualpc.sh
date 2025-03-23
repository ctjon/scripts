export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name VirtualPC \
--description 'Windows 11 VirtualPC' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/VirtualPC.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-type windows \
--os-variant win10 \
--graphics vnc \
--boot uefi \
--network network:macvtap-bridge,model=virtio \
--sound ich9 \
--import --noautoconsole


