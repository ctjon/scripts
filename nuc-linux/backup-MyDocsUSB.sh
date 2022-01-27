#!/bin/bash
echo "********************************************************************************"
export USBPATH=/run/media/chris/MyDocsUSB
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
--exclude="lost+found" \
--exclude="*.crdownload" \
--exclude=".*" \
--include=".ssh" \
--include=".thinkorswim" \
--delete-excluded \
--delete --delete-during --progress \
~chris/ $USBPATH

