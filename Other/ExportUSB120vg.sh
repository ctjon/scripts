#!/bin/sh
umount /mnt/usb120vg/boot
umount /mnt/usb120vg/home
umount /mnt/usb120vg/opt
umount /mnt/usb120vg/tmp
umount /mnt/usb120vg/usr/local
umount /mnt/usb120vg/usr
umount /mnt/usb120vg/var
umount /mnt/usb120vg/mp3s
umount /mnt/usb120vg
rmdir /mnt/usb120vg
vgchange -an usb120vg
vgexport usb120vg
vgscan
