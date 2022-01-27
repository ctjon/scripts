export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name Win10x64kvm \
--description 'Windows 10 KVM' \
--ram 4096 \
--vcpus 4 \
--disk path=/home/ctjon/VirtualMachines/Win10x64kvm.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=scsi \
--os-type windows \
--os-variant win10 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=default,model=virtio \
--sound ich9 \
--import

