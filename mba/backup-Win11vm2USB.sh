#!/bin/bash
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Windows11 VM to USB"

mkdir -p $USBPATH/VirtualMachines/parallels

rsync -aHKv -e ssh --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded ~/VirtualMachines/parallels/Windows\ 11.pvm/ $USBPATH/VirtualMachines/parallels/Windows\ 11.pvm
