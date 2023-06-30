#!/bin/bash

SRCDIR=/export/archive
DESTDIR=/export/backup/server0/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR
