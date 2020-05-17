#!/bin/bash

SRCDIR=/home/chris/vmware/
TGTDIR=/run/media/chris/Backup/VirtualMachines

echo "syncing vmware to $TGTDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR

