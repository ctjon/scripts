export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name win10kvm \
--description 'Windows 10 KVM' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/win10kvm.x86_64.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=scsi \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--import --noautoconsole

