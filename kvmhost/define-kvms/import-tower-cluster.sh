virt-install \
-n TowerA \
--description "Ansible Tower Node A" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/home/chris/kvm-vms/tower-nodeA.qcow2,bus=virtio,size-20 \
--graphics vnc \
--network type=direct,source=vmnet1
--boot hd,network,menu=on \
--import

virt-install \
-n TowerB \
--description "Ansible Tower Node B" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/home/chris/kvm-vms/tower-nodeB.qcow2,bus=virtio \
--graphics vnc \
--network type=direct,source=vmnet1
--boot hd,network,menu=on \
--import

virt-install \
-n TowerC \
--description "Ansible Tower Node C" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/home/chris/kvm-vms/tower-nodeC.qcow2,bus=virtio \
--graphics vnc \
--network type=direct,source=vmnet1
--boot hd,network,menu=on \
--import

virt-install \
-n TowerDB1 \
--description "Ansible Tower DB 1" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/home/chris/kvm-vms/tower-DB1.qcow2,bus=virtio \
--graphics vnc \
--network type=direct,source=vmnet1
--boot hd,network,menu=on \
--import

virt-install \
-n TowerDB2 \
--description "Ansible Tower DB 2" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/home/chris/kvm-vms/tower-DB2.qcow2,bus=virtio \
--graphics vnc \
--network type=direct,source=vmnet1
--boot hd,network,menu=on \
--import

