#!/bin/bash

if [ $# != 1 ]
then
	echo "usage: backup2synology <location>" where location is AZ or ND
	exit
fi

LOCATION=$1
SYNOLOGY_HOST=synology$LOCATION

BKUP_DISK=chris@$SYNOLOGY_HOST:/var/services/homes/chris/Backup
#BKUP_DISK=chris@$SYNOLOGY_HOST:/volume1/homes/chris/Backup

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/MyDocuments.backup
echo "Backup MyDocuments to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync \
--delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/MyDocuments/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Books.backup
echo "Backup Books to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/HomeVideos.backup
echo "Backup Books to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/HomeVideos/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Music.backup
echo "Backup Music to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Music/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/scripts.backup
echo "Backup scripts to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/scripts/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/playbooks.backup
echo "Backup playbooks to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/playbooks/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/thinkorswim.backup
echo "Backup thinkorswim to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/thinkorswim/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/dotfiles.backup
echo "Backup Config Files to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
--exclude=.zsh_sessions \
--exclude=.thinkorswim \
~/.??*  $BKUP_TGT
#~/.[^.]*  $BKUP_TGT
##--exclude=.config/containers \
##--exclude=.local/share/containers \

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Pictures.backup
echo "Backup Pictures to $BKUP_TGT"
rsync -e ssh -aHKvzO --rsync-path=/usr/bin/rsync --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Pictures/ $BKUP_TGT

