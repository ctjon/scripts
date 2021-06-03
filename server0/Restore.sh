#!/bin/bash
################################################################################
echo "********************************************************************************"
echo " Restoring /home/chris                                                         *"
echo "********************************************************************************"
SRCDIR=/run/media/chris/Backup/chris.home
TGTDIR=/home/chris

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=lost+found \
--exclude=VirtualMachines \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Restoring /var/lib/tftpboot                                                   *"
echo "********************************************************************************"
SRCDIR=/run/media/chris/Backup/tftpboot
TGTDIR=/var/lib/tftpboot

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
$SRCDIR/{pxelinux.cfg,images} $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Restoring /export/archive                                                     *"
echo "********************************************************************************"
SRCDIR=/run/media/chris/Backup/archive
TGTDIR=/export/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR

echo "********************************************************************************"
echo " Restoring /export/install                                                     *"
echo "********************************************************************************"
SRCDIR=/run/media/chris/Backup/install
TGTDIR=/export/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR

echo "********************************************************************************"
echo " Restoring /var/lib/libvirt/images                                             *"
echo "********************************************************************************"
SRCDIR=/run/media/chris/Backup/VirtualMachines
TGTDIR=/var/lib/libvirt/images

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR
