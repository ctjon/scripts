#!/bin/bash

SRCDIR=/export/backup/server0/kvm-vms
DESTDIR=/var/lib/libvirt/images

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \

sudo rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

sudo restorecon -RFv $DESTDIR
