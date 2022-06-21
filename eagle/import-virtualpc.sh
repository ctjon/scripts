export LIBVIRT_DEFAULT_URI=qemu:///system
<<<<<<< HEAD
sudo virt-install --name VirtualPC \
--description 'Windows 11 VirtualPC' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/VirtualPC.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-variant win10 \
--graphics spice \
--boot uefi \
--network bridge=br0,model=virtio \
--sound ich9 \
--import --noautoconsole

#--network network:macvtap-net,model=virtio \
=======
sudo virt-install --name Win11x64kvm \
--description 'Windows11 x64 KVM' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/Win11x64kvm.qcow2 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=sata \
--os-type windows \
--os-variant win10 \
--graphics spice \
--boot uefi \
--network bridge=virbr0,model=virtio \
--sound ich9 \
--import --noautoconsole

>>>>>>> 1062059df6fd3e04358517372ff8a3181e376512
