#!/bin/bash

BKUP_DISK=~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/Backup

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/MyDocuments.backup
echo "Backup MyDocuments to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/MyDocuments/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Books.backup
echo "Backup Books to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Books/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/HomeVideos.backup
echo "Backup Books to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/HomeVideos/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Music.backup
echo "Backup Music to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Music/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/scripts.backup
echo "Backup scripts to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/scripts/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/playbooks.backup
echo "Backup playbooks to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/playbooks/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/thinkorswim.backup
echo "Backup thinkorswim to $BKUP_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/thinkorswim/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/dotfiles.backup
echo "Backup Config Files to $BKUP_TGT"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
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
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Pictures/ $BKUP_TGT

