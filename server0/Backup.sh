#!/bin/bash
################################################################################
echo "********************************************************************************"
echo " Backing Up /home/chris                                                        *"
echo "********************************************************************************"
SRCDIR=/home/chris
TGTDIR=/mnt/Backup/chris.home

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=lost+found \
--exclude=VirtualMachines \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Backing Up /var/lib/tftpboot                                                  *"
echo "********************************************************************************"
SRCDIR=/var/lib/tftpboot
TGTDIR=/mnt/Backup/tftpboot

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
SRCDIR=/export/archive
TGTDIR=/mnt/Backup/archive

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
SRCDIR=/export/install
TGTDIR=/mnt/Backup/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR

echo "********************************************************************************"
echo " Backing Up /var/lib/libvirt/images                                            *"
# NEED CODE TO QUIESCE VMS IN THIS BLOCK
# ALL VMS NEED TO BE IN A PROPER STATE FOR BACKUP - shutdown/paused
echo "********************************************************************************"
SRCDIR=/var/lib/libvirt/images
TGTDIR=/mnt/Backup/VirtualMachines

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--exclude=lost+found \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR
chmod 700 $TGTDIR
