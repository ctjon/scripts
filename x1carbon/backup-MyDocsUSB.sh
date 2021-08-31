#!/bin/bash
echo "********************************************************************************"
export USBPATH=/run/media/chris/MyDocumentsUSB
echo "syncing Home Directory to USB"
touch $USBPATH/timestamp
rsync -aHKz \
--exclude="pCloudDrive/Automatic Upload" \
--exclude="pCloudDrive/pCloud Backup" \
--exclude="pCloudDrive/pCloud Save" \
--exclude="pCloudDrive/System Volume Information" \
--exclude="vmware" \
--exclude="mbp" \
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

