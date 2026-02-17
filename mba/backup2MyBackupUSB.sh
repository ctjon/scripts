#!/bin/bash

USB_DISK=/Volumes/MyBackupUSB

echo "********************************************************************************"
export USB_TGT=$USB_DISK/MyDocuments.backup
echo "Backup MyDocuments to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/MyDocuments/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Books.backup
echo "Backup Books to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/HomeVideos.backup
echo "Backup Books to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/HomeVideos/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Music.backup
echo "Backup Music to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Music/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/scripts.backup
echo "Backup scripts to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/scripts/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/playbooks.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/playbooks/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/thinkorswim.backup
echo "Backup thinkorswim to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/thinkorswim/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/dotfiles.backup
echo "Backup Config Files to $USB_TGT"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
--exclude=.zsh_sessions \
--exclude=.thinkorswim \
~/.??*  $USB_TGT
#~/.[^.]*  $USB_TGT
##--exclude=.config/containers \
##--exclude=.local/share/containers \

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Pictures.backup
echo "Backup Pictures to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
~/Pictures/ $USB_TGT

