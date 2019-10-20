#!/bin/bash
################################################################################
echo "********************************************************************************"
echo " Backing Up /home/chris                                                        *"
echo "********************************************************************************"
SRCDIR=server0:/home/chris
TGTDIR=/run/media/chris/Backup/chris

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=lost+found \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Backing Up /var/lib/tftpboot                                                  *"
echo "********************************************************************************"
SRCDIR=server0:/var/lib/tftpboot
TGTDIR=/run/media/chris/Backup/tftpboot

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
$SRCDIR/{pxelinux.cfg,images} $TGTDIR
chmod 700 $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Backing Up /export/archive                                                    *"
echo "********************************************************************************"
SRCDIR=server0:/export/archive
TGTDIR=/run/media/chris/Backup/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR

echo "********************************************************************************"
echo " Backing Up /export/install                                                    *"
echo "********************************************************************************"
SRCDIR=server0:/export/install
TGTDIR=/run/media/chris/Backup/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR
