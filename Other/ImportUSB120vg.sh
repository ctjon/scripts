#!/bin/sh
vgscan
vgimport usb120vg
vgchange -ay usb120vg
mkdir /mnt/usb120vg
mount /dev/usb120vg/rootlv /mnt/usb120vg
BOOT=`df -k |grep /media/disk|awk '{print $1}'`
umount $BOOT
mount $BOOT /mnt/usb120vg/boot
mount /dev/usb120vg/homelv /mnt/usb120vg/home
mount /dev/usb120vg/optlv /mnt/usb120vg/opt
mount /dev/usb120vg/tmplv /mnt/usb120vg/tmp
mount /dev/usb120vg/usrlv /mnt/usb120vg/usr
mount /dev/usb120vg/locallv /mnt/usb120vg/usr/local
mount /dev/usb120vg/varlv /mnt/usb120vg/var
mount /dev/usb120vg/mp3lv /mnt/usb120vg/mp3s
