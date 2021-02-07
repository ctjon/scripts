sudo virt-install \
-n TowerA \
--description "Ansible Tower Node A" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/var/lib/libvirt/images/tower-nodeA.x86_64.qcow2,bus=virtio,size=20 \
--graphics vnc \
--network bridge=br0,model=virtio \
--boot hd,network,menu=on \
--pxe

exit

sudo virt-install \
-n TowerB \
--description "Ansible Tower Node B" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/var/lib/libvirt/images/tower-nodeB.x86_64.qcow2,bus=virtio,size=20 \
--graphics vnc \
--network bridge=br0,model=virtio \
--boot hd,network,menu=on \
--pxe

sudo virt-install \
-n TowerC \
--description "Ansible Tower Node C" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/var/lib/libvirt/images/tower-nodeC.x86_64.qcow2,bus=virtio,size=20 \
--graphics vnc \
--network bridge=br0,model=virtio \
--boot hd,network,menu=on \
--pxe

sudo virt-install \
-n TowerDB1 \
--description "Ansible Tower DB 1" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/var/lib/libvirt/images/tower-DB1.x86_64.qcow2,bus=virtio,size=20 \
--graphics vnc \
--network bridge=br0,model=virtio \
--boot hd,network,menu=on \
--pxe

sudo virt-install \
-n TowerDB2 \
--description "Ansible Tower DB 2" \
--os-type=Linux \
--os-variant=rhel7 \
--ram=4096 \
--vcpus=4 \
--disk path=/var/lib/libvirt/images/tower-DB2.x86_64.qcow2,bus=virtio,size=20 \
--graphics vnc \
--network bridge=br0,model=virtio \
--boot hd,network,menu=on \
--pxe

