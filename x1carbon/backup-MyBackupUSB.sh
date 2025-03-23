#!/bin/bash
echo "********************************************************************************"
export USBPATH=/run/media/chris/MyBackupUSB
echo "syncing Home Directory to USB"
touch $USBPATH/homedir/timestamp
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
~chris/ $USBPATH/homedir

