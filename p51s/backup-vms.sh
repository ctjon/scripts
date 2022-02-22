#!/bin/bash

SRCDIR=/home/chris/VirtualMachines/
TGTDIR=/run/media/chris/MyBackupUSB/VirtualMachines

echo "syncing VirtualMachines to $TGTDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR

