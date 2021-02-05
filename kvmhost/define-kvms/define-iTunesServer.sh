#!/bin/bash

sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.x86_64.qcow2,device=disk,bus=virtio,size=40 \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=ide \
--os-type windows \
--os-variant win10 \
--graphics vnc \
--network bridge:br0,model=virtio \
--noautoconsole 

#--boot hd \
#--noautoconsole --import
#--disk path=/export/archive/Windows/Microsoft/Windows8/en_windows_8_x64_dvd_915440.iso,device=cdrom,bus=ide \
