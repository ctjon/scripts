#!/bin/bash
echo "********************************************************************************"
export BACKUP_TARGET=/Users/chris/pCloud\ Drive
echo "Backup Up to $BACKUP_TARGET"

touch "$BACKUP_TARGET/timestamp"

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/MyDocuments/ "$BACKUP_TARGET/Crypto Folder/MyDocuments.backup"

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/playbooks/ "$BACKUP_TARGET/playbooks"

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/scripts/ "$BACKUP_TARGET/scripts"

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~/scripts.old/ "$BACKUP_TARGET/scripts.old"

#rsync -aHKvz --delete --delete-excluded --delete-during --progress \
#~/Pictures/ "$BACKUP_TARGET/Pictures"
