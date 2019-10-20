sync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete chris@172.16.1.145:~/ ~

scp chris@172.16.1.145:/var/lib/libvirt/images/towerkvm.x86_64.qcow2 /var/lib/libvirt/images
scp chris@172.16.1.145:/var/lib/libvirt/images/win10kvm.x86_64.qcow2 /var/lib/libvirt/images
