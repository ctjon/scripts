#!/bin/bash
echo "********************************************************************************"
export BACKUP_TARGET=/Users/chris/pCloud\ Drive
echo "Backup Up to $BACKUP_TARGET"

touch "$BACKUP_TARGET/timestamp"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/MyDocuments/ "$BACKUP_TARGET/Crypto Folder/MyDocuments.backup"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/playbooks/ "$BACKUP_TARGET/playbooks"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/scripts/ "$BACKUP_TARGET/scripts"

rsync -aHKvz --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/scripts.old/ "$BACKUP_TARGET/scripts.old"

rsync -aHIKvz --size-only --delete --delete-excluded --delete-during --progress --no-times \
--exclude=.DS_Store \
~/Pictures/ "$BACKUP_TARGET/Pictures"
