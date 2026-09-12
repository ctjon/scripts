#!/bin/bash

NET_SHARE=/Volumes/home/Backup

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/MyDocuments-ProtonDrive.backup
echo "Backup MyDocuments to $BKUP_TGT"
rsync -rltHKvzO --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/MyDocuments/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/Books-ProtonDrive.backup
echo "Backup Books to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/Books/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/HomeVideos-ProtonDrive.backup
echo "Backup Books to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/HomeVideos/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/Music.backup
echo "Backup Music to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Music/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/scripts.backup
echo "Backup scripts to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/scripts/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/playbooks.backup
echo "Backup playbooks to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/playbooks/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/thinkorswim.backup
echo "Backup thinkorswim to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/thinkorswim/ $BKUP_TGT

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/dotfiles.backup
echo "Backup Config Files to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
--exclude=.zsh_sessions \
--exclude=.thinkorswim \
~/.??*  $BKUP_TGT
#~/.[^.]*  $BKUP_TGT
##--exclude=.config/containers \
##--exclude=.local/share/containers \

echo "********************************************************************************"
export BKUP_TGT=$NET_SHARE/Pictures.backup
echo "Backup Pictures to $BKUP_TGT"
rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Pictures/ $BKUP_TGT


#echo "********************************************************************************"
#export BKUP_TGT=$NET_SHARE/MyDocuments-iCloud.backup
#echo "Backup MyDocuments to $BKUP_TGT"
#rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#~/Library/Mobile\ Documents/com~apple~CloudDocs/MyDocuments/ $BKUP_TGT

#echo "********************************************************************************"
#export BKUP_TGT=$NET_SHARE/Books-iCloud.backup
#echo "Backup Books to $BKUP_TGT"
#rsync -rltHKvz0 --no-times --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#~/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $BKUP_TGT

#echo "********************************************************************************"
#export BKUP_TGT=$NET_SHARE/HomeVideos-iCloud.backup
#echo "Backup Books to $BKUP_TGT"
#rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#~/Library/Mobile\ Documents/com~apple~CloudDocs/HomeVideos/ $BKUP_TGT
