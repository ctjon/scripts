#!/bin/bash

################################################################################
# Backup /var/lib/tftpboot/images                                              #
################################################################################
SRCDIR=/export/backup/server0/tftpboot/images
DESTDIR=/var/lib/tftpboot/images

sudo rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /var/lib/tftpboot/pxelinux.cfg                                        #
################################################################################
SRCDIR=/export/backup/server0/tftpboot/pxelinux.cfg
DESTDIR=/var/lib/tftpboot/pxelinux.cfg

sudo rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /export/install                                                       #
################################################################################
SRCDIR=/export/backup/server0/install
DESTDIR=/export/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR


