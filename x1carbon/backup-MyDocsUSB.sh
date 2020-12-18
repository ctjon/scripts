#!/bin/bash
echo "********************************************************************************"
export USBPATH=~/QuickenBackup
echo "syncing QuickenBackup to USB"
touch $USBPATH/timestamp
rsync -aHKz -e ssh \
--progress \
server0.internal.tjon.net:~chris/QuickenBackup/ $USBPATH

#grive -p ~/GoogleDrive

echo "********************************************************************************"
export USBPATH=/run/media/chris/MyDocumentsUSB
echo "syncing Home Directory to USB"
touch $USBPATH/timestamp
rsync -aHKz \
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

