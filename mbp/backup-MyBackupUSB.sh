#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/MyDocuments/ $USBPATH/homedir/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/playbooks/ $USBPATH/homedir/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/scripts/ $USBPATH/homedir/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Music/ $USBPATH/homedir/Music

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $USBPATH/homedir/Books

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Pictures/ $USBPATH/homedir/Pictures

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Movies/TV/Media.localized/Home\ Videos/ $USBPATH/HomeVideos

touch $USBPATH/homedir/timestamp
