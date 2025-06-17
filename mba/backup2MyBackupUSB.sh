#!/bin/bash

USB_DISK=/Volumes/MyBackupUSB

echo "********************************************************************************"
export USB_TGT=$USB_DISK/iCloud.backup
echo "Backup MyDocuments to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
/Users/chris/Library/Mobile\ Documents/com~apple~CloudDocs/ $USB_TGT
#/Users/chris/MyDocuments/ $USB_TGT

#echo "********************************************************************************"
#export USB_TGT=$USB_DISK/MyDocuments.backup
#echo "Backup MyDocuments to $USB_TGT"
#rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#/Users/chris/MyDocuments/ $USB_TGT

#echo "********************************************************************************"
#export USB_TGT=$USB_DISK/Books.backup
#echo "Backup Books to $USB_TGT"
#rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
#--progress --exclude=.DS_Store \
#/Users/chris/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/Books/ $USB_TGT
#/Users/chris/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Music.backup
echo "Backup Music to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/Music/" $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/scripts.backup
echo "Backup scripts to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/scripts/" $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/playbooks.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/playbooks/" $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/thinkorswim.backup
echo "Backup thinkorswim to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/thinkorswim/" $USB_TGT

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
"/Users/chris/Pictures/" $USB_TGT

