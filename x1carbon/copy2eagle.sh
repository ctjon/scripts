#!/bin/bash
echo "********************************************************************************"
export SRCDIR=~/
export NETDIR=chris@172.16.1.139:~
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
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
--delete-excluded \
$SRCDIR/ $NETDIR

