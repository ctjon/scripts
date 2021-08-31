export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name Win10x64kvm \
--description 'Windows 10 KVM' \
--ram 4096 \
--vcpus 4 \
--disk path=/home/chris/VirtualMachines/Win10x64kvm/Win10x64kvm.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=scsi \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=default,model=virtio \
--import

