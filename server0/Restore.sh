#!/bin/bash
################################################################################
echo "********************************************************************************"
echo " Restoring /home/chris                                                         *"
echo "********************************************************************************"
SRCDIR=/mnt/Backup/chris.home
TGTDIR=/home/chris

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=VirtualMachines \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Restoring /var/lib/tftpboot                                                   *"
echo "********************************************************************************"
SRCDIR=/mnt/Backup/tftpboot
TGTDIR=/var/lib/tftpboot

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-before \
--delete-excluded \
$SRCDIR/{pxelinux.cfg,images} $TGTDIR

################################################################################
echo "********************************************************************************"
echo " Restoring /export/archive                                                     *"
echo "********************************************************************************"
SRCDIR=/mnt/Backup/archive
TGTDIR=/export/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-before \
--delete-excluded \
$SRCDIR/ $TGTDIR

echo "********************************************************************************"
echo " Restoring /export/install                                                     *"
echo "********************************************************************************"
SRCDIR=/mnt/Backup/install
TGTDIR=/export/install

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR

echo "********************************************************************************"
echo " Restoring /var/lib/libvirt/images                                             *"
echo "********************************************************************************"
SRCDIR=/mnt/Backup/VirtualMachines
TGTDIR=/var/lib/libvirt/images

sudo rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=.* \
--delete-before \
--delete-excluded \
--exclude=ubuntu-reposyncs \
$SRCDIR/ $TGTDIR

sudo mkdir /var/lib/libvirt/images/lost+found
sudo chmod 700 /var/lib/libvirt/images/lost+found
