#!/bin/bash

SRCDIR=/home/chris/VirtualMachines/
TGTDIR=/run/media/chris/vm-Backups/VirtualMachines

echo "syncing vmware to $TGTDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR

