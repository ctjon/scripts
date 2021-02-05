#!/bin/bash

sudo virt-install --name iTunesServer \
--description 'iTunesServer' \
--ram 4096 \
--vcpus 4 \
--disk path=/var/lib/libvirt/images/iTunesServer.qcow2,device=disk,bus=virtio,size=48 \
--disk path=/dev/sda1,device=disk,bus=virtio \
--cdrom=/var/lib/libvirt/images/ISOs/Win10_2004_English_x64.iso \
--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom \
--os-type windows \
--os-variant win10 \
--graphics vnc \
--network bridge:br0,model=virtio \
--boot cdrom 

#--disk path=/var/lib/libvirt/images/iTunesServer.x86_64.qcow2,device=disk,bus=virtio,size=40 \
#--noautoconsole --import
#--disk path=/export/archive/Windows/Microsoft/Windows8/en_windows_8_x64_dvd_915440.iso,device=cdrom,bus=scsi \
#--disk path=/usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=scsi \
