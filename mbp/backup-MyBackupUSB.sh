#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $USBPATH/homedir/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $USBPATH/homedir/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $USBPATH/homedir/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books/ $USBPATH/homedir/Books

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Pictures/ $USBPATH/homedir/Pictures

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/Music/ $USBPATH/Music

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/HomeVideos/ $USBPATH/HomeVideos

touch $USBPATH/homedir/timestamp
