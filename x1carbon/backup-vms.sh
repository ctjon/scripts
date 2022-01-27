#!/bin/bash

SRCDIR=/home/ctjon/VirtualMachines/
TGTDIR=/run/media/ctjon/MyBackupUSB/VirtualMachines

echo "syncing VirtualMachines to $TGTDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR

