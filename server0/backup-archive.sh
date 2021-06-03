#!/bin/bash

SRCDIR=/export/archive
DESTDIR=/run/media/chris/Backup/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR
