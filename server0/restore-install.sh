#!/bin/bash

################################################################################
# Backup /var/lib/tftpboot/images                                              #
################################################################################
#SRCDIR=/var/lib/tftpboot/images
#DESTDIR=/export/backup/server0/tftpboot/images
#
#rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
#--exclude=.* \
#--delete-excluded \
#$SRCDIR/ $DESTDIR

################################################################################
# Backup /var/lib/tftpboot/pxelinux.cfg                                        #
################################################################################
#SRCDIR=/var/lib/tftpboot/pxelinux.cfg
#DESTDIR=/export/backup/server0/tftpboot/pxelinux.cfg
#
#rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
#--exclude=.* \
#--delete-excluded \
#$SRCDIR/ $DESTDIR

################################################################################
# Backup /export/install                                                       #
################################################################################
SRCDIR=/export/backup/server0/install
DESTDIR=/export/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--delete-excluded \
$SRCDIR/ $DESTDIR


