#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir
touch $USBPATH/homedir/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $USBPATH/homedir/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $USBPATH/homedir/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $USBPATH/homedir/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts.old/ $USBPATH/homedir/scripts.old

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books.backup/ $USBPATH/homedir/Books.backup
