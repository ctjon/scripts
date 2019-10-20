#!/bin/bash

#chris@server0.internal.tjon.net:/export/vmbackup/kvm-vms

SRCDIR=/var/lib/libvirt/images
USBDIR=/run/media/chris/LinBkup/kvm-vms
NETDIR=chris@server0:/export/vmbackup/kvm-vms

echo "syncing kvm-vms to $USBDIR"
sudo rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude="*test*" \
--delete-excluded \
$SRCDIR/ $USBDIR

#echo "syncing kvm-vms from $USBDIR to $NETDIR"
#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
#--exclude=.* \
#--exclude="*testkvm*" \
#--delete-excluded \
#$USBDIR/ $NETDIR

#USBDIR=/run/media/chris/LinBkup/VirtualMachineDisks
#NETDIR=chris@server0:/export/vmbackup/VirtualMachineDisks

#echo "syncing VirtualMachineDisks from $USBDIR to $NETDIR"
#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
#--exclude=.* \
#--delete-excluded \
#$USBDIR/ $NETDIR

#
# Backup any vmware VMs
#
SRCDIR=/home/chris/vmware
USBDIR=/run/media/chris/LinBkup/VirtualMachines
NETDIR=chris@server0:/export/vmbackup/VirtualMachines

echo "syncing vmware vms to $USBDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude="*testvm*" \
--delete-excluded \
$SRCDIR/ $USBDIR

#echo "syncing vmware vms from $USBDIR to $NETDIR"
#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
#--exclude=.* \
#--exclude="*testvm*" \
#--delete-excluded \
#$USBDIR/ $NETDIR

