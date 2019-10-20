#!/bin/bash

DESTDIR=/export/archive
#USBDIR=/mnt/LinBkup/Archive
USBDIR=chris@server0:/export/archive

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$USBDIR/ $DESTDIR

