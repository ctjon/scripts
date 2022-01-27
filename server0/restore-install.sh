#!/bin/bash

################################################################################
# Restore /var/lib/tftpboot/images                                             #
################################################################################
#SRCDIR=/run/media/chris/Backup/tftpboot/images
SRCDIR=/mnt/Backup/tftpboot/images
#DESTDIR=server0:/var/lib/tftpboot/images
DESTDIR=/var/lib/tftpboot/images

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

chown -R root:root $DESTDIR
restorecon -RFv $DESTDIR

################################################################################
# Restore /var/lib/tftpboot/pxelinux.cfg                                       #
################################################################################
#SRCDIR=/run/media/chris/Backup/tftpboot/pxelinux.cfg
SRCDIR=/mnt/Backup/tftpboot/pxelinux.cfg
#DESTDIR=server0:/var/lib/tftpboot/pxelinux.cfg
DESTDIR=/var/lib/tftpboot/pxelinux.cfg

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

chown -R root:root $DESTDIR
restorecon -RFv $DESTDIR

################################################################################
# Restore /export/install                                                      #
################################################################################
#SRCDIR=/run/media/chris/Backup/install
SRCDIR=/mnt/Backup/install
#DESTDIR=server0:/export/install
DESTDIR=/export/install

#rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-excluded \
$SRCDIR/ $DESTDIR

chown -R chris:chris $DESTDIR
restorecon -RFv $DESTDIR

