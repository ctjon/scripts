#!/bin/bash
echo "********************************************************************************"
export USBPATH=/run/media/chris/MyBackupUSB
echo "syncing Home Directory to USB"
touch $USBPATH/homedir/timestamp
rsync -aHKz \
--exclude="pCloudDrive" \
--exclude="vmware" \
--exclude="VirtualMachines" \
--exclude="kvm-vms" \
--exclude ".cache" \
--exclude "*.crdownload" \
--exclude ".ccache" \
--exclude ".local/share/Trash" \
--delete-excluded \
--delete --delete-during --progress \
 $USBPATH/homedir/ ~chris


