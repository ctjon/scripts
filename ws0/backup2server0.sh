#!/bin/bash
echo "********************************************************************************"
export TGTPATH=chris@server0:/export/backup/eagle/chris
echo "syncing Home Directory to USB"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude="pCloudDrive" \
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
~chris/ $TGTPATH

