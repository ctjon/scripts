#!/bin/bash

################################################################################
# copy /export/backup                                                          #
################################################################################
SRCDIR=/mnt/obackup
DESTDIR=/export/backup

mkdir -p $DESTDIR
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--delete-excluded \
--exclude=James-PC \
$SRCDIR/ $DESTDIR


