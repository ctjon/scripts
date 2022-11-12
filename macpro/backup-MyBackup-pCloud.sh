#!/bin/bash
echo "********************************************************************************"
export BACKUP_TARGET=/Users/chris/pCloud\ Drive
echo "Backup Up to $BACKUP_TARGET"

touch "$BACKUP_TARGET/timestamp"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
~/MyDocuments/ "$BACKUP_TARGET/Crypto Folder/MyDocuments.backup"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
~/playbooks/ "$BACKUP_TARGET/playbooks"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
~/scripts/ "$BACKUP_TARGET/scripts"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
~/scripts.old/ "$BACKUP_TARGET/scripts.old"

#rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
#~/Pictures/ "$BACKUP_TARGET/Pictures"
