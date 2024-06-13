#!/bin/bash
echo "********************************************************************************"
export BACKUP_TARGET=~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me/
echo "Backup Up to $BACKUP_TARGET"

touch "$BACKUP_TARGET/timestamp"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-p --no-o --no-g --no-times \
--exclude=.DS_Store \
~/MyDocuments/ "$BACKUP_TARGET/MyDocuments.backup"
