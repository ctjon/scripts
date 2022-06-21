#!/bin/bash
export TGTPATH=chris@server0:/export/backup/x1carbon/homedir

#grive -p ~/GoogleDrive

echo "********************************************************************************"
echo "syncing Home Directory to server0"
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
~chris/ $TGTPATH

export TGTPATH=chris@server0:/export/backup/x1carbon/kvm-vms
echo "syncing Virtual Machines to server0"
sudo rsync -e ssh -aHKz \
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
/var/lib/libvirt/images/ $TGTPATH
