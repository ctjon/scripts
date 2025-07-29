#!/bin/bash

USB_DISK=/Volumes/MyBackupUSB

echo "********************************************************************************"
export USB_TGT=$USB_DISK/MyDocuments.backup
echo "Backup MyDocuments to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
/Users/chris/MyDocuments/ /Users/chris/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder/MyDocuments.backup


