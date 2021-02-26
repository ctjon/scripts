export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/home/chris/VirtualMachines/iTunesServer/iTunesServer.qcow2 \
--os-type windows \
--os-variant win10 \
--graphics spice \
--boot hd,network,menu=on \
--network default,model=e1000 \
--import

