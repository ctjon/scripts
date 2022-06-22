#!/bin/bash

SRCDIR=/export/backup/server0/archive
DESTDIR=/export/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR
