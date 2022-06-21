export LIBVIRT_DEFAULT_URI=qemu:///system
sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
<<<<<<< HEAD
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2 \
--disk path=/dev/raid10vg/ituneslv \
=======
--disk path=/home/chris/VirtualMachines/iTunesServer.qcow2 \
--disk path=/dev/sda1 \
--os-type windows \
>>>>>>> 1062059df6fd3e04358517372ff8a3181e376512
--os-variant win10 \
--graphics vnc \
--sound ich9 \
--boot hd,network,menu=on \
--network bridge=br0,model=virtio \
--import

<<<<<<< HEAD
#--network network:macvtap-net,model=virtio \
=======
>>>>>>> 1062059df6fd3e04358517372ff8a3181e376512
