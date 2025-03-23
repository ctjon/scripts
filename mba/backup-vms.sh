#!/bin/bash
export BACKUP_HOST=chris@ds224.internal.tjon.net

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/parallels.backup
echo "Backup Up MyDocuments to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
~/Parallels $BACKUP_TARGET
