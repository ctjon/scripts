#!/bin/bash

SRCDIR=~
NETDIR=chris@server0.internal.tjon.net:~

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $NETDIR

