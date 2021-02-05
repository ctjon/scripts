#!/bin/bash

SRCDIR=/home/chris/mbp/
TGTDIR=/run/media/chris/vm-Backups/mbp

echo "syncing vmware to $TGTDIR"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.DS_Store* \
--delete-excluded \
$SRCDIR/ $TGTDIR

