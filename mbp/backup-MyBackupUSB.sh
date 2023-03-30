#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/MyDocuments/ $USBPATH/homedir/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/playbooks/ $USBPATH/homedir/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/scripts/ $USBPATH/homedir/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/Books/ $USBPATH/homedir/Books

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/Pictures/ $USBPATH/homedir/Pictures

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/Music/ $USBPATH/Music

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/Movies/TV/Media.localized/Home\ Videos/ $USBPATH/HomeVideos

touch $USBPATH/homedir/timestamp
