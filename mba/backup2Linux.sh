#!/bin/bash

set -x 

#BKUP_DISK=~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/Backup
BKUP_DISK=chris@172.16.2.156:/home/chris/Stuff

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/MyDocuments
echo "Backup MyDocuments to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/MyDocuments/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/Books
echo "Backup Books to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Books/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/HomeVideos
echo "Backup Books to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/HomeVideos/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/scripts
echo "Backup scripts to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/scripts/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/playbooks
echo "Backup playbooks to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/playbooks/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$BKUP_DISK/thinkorswim
echo "Backup thinkorswim to $BKUP_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/thinkorswim/ $BKUP_TGT

#echo "********************************************************************************"
#export BKUP_TGT=$BKUP_DISK/dotfiles
#echo "Backup Config Files to $BKUP_TGT"
#rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
#--exclude=.DS_Store \
#--exclude=.Trash \
#--exclude=.zsh_sessions \
#--exclude=.thinkorswim \
#~/.??*  $BKUP_TGT
##~/.[^.]*  $BKUP_TGT
###--exclude=.config/containers \
###--exclude=.local/share/containers \

#echo "********************************************************************************"
#export BKUP_TGT=$BKUP_DISK/Pictures
#echo "Backup Pictures to $BKUP_TGT"
#rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#~/Pictures/ $BKUP_TGT

