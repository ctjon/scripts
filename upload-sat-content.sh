#!/bin/bash

SRCDIR=/run/media/chris/LinBkup/satcontent
DESTDIR=chris@server0.internal.tjon.net:/export/satcontent

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

