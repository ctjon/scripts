#!/bin/bash
SRCDIR=/opt/local/archive/
TGTDIR=/run/media/chris/vm-Backups/Archive

echo "syncing $SRCDIR to $TGTDIR"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR


SRCDIR=/opt/local/vm-backups/
TGTDIR=/run/media/chris/vm-Backups/VirtualMachines

echo "syncing $SRCDIR to $TGTDIR"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $TGTDIR



