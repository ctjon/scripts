#!/bin/bash

SRCDIR=/export/plex
DESTDIR=/export/backup/server0/plex

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR
