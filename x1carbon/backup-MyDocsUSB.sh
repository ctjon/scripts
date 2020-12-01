#!/bin/bash
export USBPATH=/run/media/chris/MyDocumentsUSB

#grive -p ~/GoogleDrive

echo "********************************************************************************"
echo "syncing Home Directory to USB"
rsync -aHKz \
--exclude="vmware" \
--exclude="VirtualMachines" \
--exclude="kvm-vms" \
--exclude "lost+found" \
--exclude ".cache" \
--exclude "*.crdownload" \
--exclude ".ccache" \
--exclude ".local/share/Trash" \
--exclude "RhDocuments/.trash" \
--delete-excluded \
--delete --delete-during --progress \
~chris/ $USBPATH
touch $USBPATH/timestamp
