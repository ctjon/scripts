#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
touch $USBPATH/homedir/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $USBPATH/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $USBPATH/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $USBPATH/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts.old/ $USBPATH/scripts.old
