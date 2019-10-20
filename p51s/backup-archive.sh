#!/bin/bash

SRCDIR=/export/archive
USBDIR=/run/media/chris/LinBkup/Archive
NETDIR=chris@server0.internal.tjon.net:/export/archive

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $USBDIR

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

