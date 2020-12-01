#!/bin/bash

SRCDIR=/opt/local/archive
NETDIR=chris@server0.internal.tjon.net:/export/archive

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

