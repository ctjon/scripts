#!/bin/bash

################################################################################
# Backup /var/lib/tftpboot/images                                              #
################################################################################
SRCDIR=/var/lib/tftpboot/images
DESTDIR=/run/media/chris/Backup/tftpboot/images

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /var/lib/tftpboot/pxelinux.cfg                                        #
################################################################################
DESTDIR=/run/media/chris/Backup/tftpboot/pxelinux.cfg
SRCDIR=/var/lib/tftpboot/pxelinux.cfg

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

################################################################################
# Backup /export/install                                                       #
################################################################################
SRCDIR=/export/install
DESTDIR=/run/media/chris/Backup/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR


