#!/bin/bash
echo "********************************************************************************"
export BACKUP_TARGET=/Users/chris/pCloud\ Drive
echo "Backup Up to $BACKUP_TARGET"

touch "$BACKUP_TARGET/timestamp"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/MyDocuments/ "$BACKUP_TARGET/Crypto Folder/MyDocuments.backup"
