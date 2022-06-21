#!/bin/bash

SRCDIR=chris@server0:/export/install
DESTDIR=/export/install

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.DS_Store* \
--delete-excluded \
$SRCDIR/ $DESTDIR
