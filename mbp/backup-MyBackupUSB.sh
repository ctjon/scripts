#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir

echo "Backing up MyDocuments"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/MyDocuments/ $USBPATH/homedir/MyDocuments

echo "Backing up playbooks"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/playbooks/ $USBPATH/homedir/playbooks

echo "Backing up scripts"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/scripts/ $USBPATH/homedir/scripts

echo "Backing up Music"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Music/ $USBPATH/homedir/Music

echo "Backing up Books"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Books/ $USBPATH/homedir/Books
#~/Library/Mobile\ Documents/com~apple~CloudDocs/Books/ $USBPATH/homedir/Books

echo "Backing up Pictures"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Pictures/ $USBPATH/homedir/Pictures

echo "Backing up HomeVideos"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/HomeVideos/ $USBPATH/HomeVideos

touch $USBPATH/homedir/timestamp
