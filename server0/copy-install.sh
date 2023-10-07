#!/bin/bash

################################################################################
# copy /export/install                                                         #
################################################################################
SRCDIR=/export/install
DESTDIR=/export/newinstall

mkdir -p $DESTDIR
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--delete-excluded \
$SRCDIR/ $DESTDIR


