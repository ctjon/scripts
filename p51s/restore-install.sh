#!/bin/bash

DESTDIR=/export/install
USBDIR=/mnt/LinBkup/export-install

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$USBDIR/ $DESTDIR

