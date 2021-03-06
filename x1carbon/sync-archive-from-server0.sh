#!/bin/bash

SRCDIR=chris@server0.internal.tjon.net:/export/archive/
NETDIR=/opt/local/archive

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

