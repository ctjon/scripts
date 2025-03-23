#!/bin/bash

SRCDIR=/export/backup/server0/plex
DESTDIR=/export/plex

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR
