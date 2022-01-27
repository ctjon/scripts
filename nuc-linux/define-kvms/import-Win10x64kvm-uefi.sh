export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name Win10x64kvm-UEFI \
--description 'Windows 10 KVM UEFI' \
--ram 4096 \
--vcpus 4 \
--disk path=/home/chris/VirtualMachines/Win10x64kvm-uefi.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=scsi \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=default,model=virtio \
--sound ich9 \
--import

#--boot uefi \

