export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name win10kvm \
--description 'Windows 10 KVM' \
--ram 4096 \
--vcpus 4 \
--disk path=/home/chris/VirtualMachines/Win10x64kvm.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-type windows \
--os-variant win8.1 \
--graphics vnc \
--boot hd,network,menu=on \
--network bridge=virbr0,model=virtio \
--sound ich9 \
--import --noautoconsole

