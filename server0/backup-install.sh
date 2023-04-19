#!/bin/bash

################################################################################
# Backup /var/lib/tftpboot/images                                              #
################################################################################
SRCDIR=/var/lib/tftpboot/images
DESTDIR=/export/backup/server0/tftpboot/images

mkdir -p $DESTDIR
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /var/lib/tftpboot/pxelinux.cfg                                        #
################################################################################
SRCDIR=/var/lib/tftpboot/pxelinux.cfg
DESTDIR=/export/backup/server0/tftpboot/pxelinux.cfg

mkdir -p $DESTDIR
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /export/install                                                       #
################################################################################
SRCDIR=/export/install
DESTDIR=/export/backup/server0/install

mkdir -p $DESTDIR
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--delete-excluded \
$SRCDIR/ $DESTDIR


