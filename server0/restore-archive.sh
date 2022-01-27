#!/bin/bash

#SRCDIR=/run/media/chris/Backup/archive
SRCDIR=/mnt/Backup/archive
#DESTDIR=server0:/export/archive
DESTDIR=/export/archive

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

#chown -R chris:chris $DESTDIR
#restorecon -RFv $DESTDIR

