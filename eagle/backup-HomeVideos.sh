#!/bin/bash
echo "********************************************************************************"
echo "FIX THE PATH"
exit
export USBPATH=/run/media/chris/MyBackupUSB
echo "syncing Home Videos Directory to USB"
mkdir -p $USBPATH/HomeVideos
sudo mount /dev/sda1 -t ntfs -o ro /mnt/iTunesLibrary
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude="vmware" \
--exclude="VirtualMachines" \
--exclude="kvm-vms" \
--exclude ".cache" \
--exclude ".DS_Store" \
--exclude ".pcloud" \
--exclude ".Trash*" \
--exclude "*.crdownload" \
--exclude ".ccache" \
--exclude ".local/share/Trash" \
/mnt/iTunesLibrary/HomeVideos/ $USBPATH/HomeVideos
touch $USBPATH/HomeVideos/timestamp
sudo umount /mnt/iTunesLibrary

