export LIBVIRT_DEFAULT_URI=qemu:///system
virt-install --name towerkvm \
--description "Ansible-Tower-KVM" \
--ram=4096 \
--vcpus=2 \
--disk path=/home/chris/kvm-vms/towerkvm.x86_64.qcow2,bus=virtio \
--os-type=linux \
--os-variant=rhel7.6 \
--graphics vnc \
--boot hd,network,menu=on \
--network network=vnet_nat1,model=virtio \
--import 


