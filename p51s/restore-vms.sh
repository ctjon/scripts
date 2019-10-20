#!/bin/bash

DESTDIR=/home/chris/vmware
USBDIR=/run/media/chris/p51sBkup/VirtualMachines
NETDIR=chris@server0:/export/vmbackup/VirtualMachines

echo "syncing vmware vms to $USBDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$USBDIR/ $DESTDIR

DESTDIR=/home/chris/kvm-vms
USBDIR=/run/media/chris/p51sBkup/kvm-vms
NETDIR=chris@server0:/export/vmbackup/kvm-vms

echo "syncing kvm-vms to $USBDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$USBDIR/ $DESTDIR
