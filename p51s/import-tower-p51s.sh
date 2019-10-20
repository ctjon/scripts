export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name tower-p51s \
--description "Ansible-Tower-p51s" \
--ram=4096 \
--vcpus=2 \
--disk path=/var/lib/libvirt/images/tower-p51s.x86_64.qcow2,bus=virtio \
--os-type=linux \
--os-variant=rhel7.6 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--import --noautoconsole


