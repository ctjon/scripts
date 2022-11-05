#!/bin/bash
echo "********************************************************************************"
export BACKUP_PATH=/Users/chris/pCloud\ Drive
echo "Backup Up to pCloud"
touch $BACKUP_PATH/timestamp
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $BACKUP_PATH/Crypto\Folder/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $BACKUP_PATH/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $BACKUP_PATH/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts.old/ $BACKUP_PATH/scripts.old

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Pictures/ $BACKUP_PATH/Pictures
