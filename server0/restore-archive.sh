#!/bin/bash

SRCDIR=/run/media/chris/Backup/archive
DESTDIR=server0:/export/archive

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

ssh server0 chown -R chris:chris $DESTDIR
ssh server0 restorecon -RFv $DESTDIR

