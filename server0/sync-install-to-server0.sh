#!/bin/bash

SRCDIR=/run/media/chris/Backup/install/
NETDIR=chris@server0.internal.tjon.net:/export/install

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

