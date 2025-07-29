#!/bin/bash

export PROTON_DRIVE=/Users/chris/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me-folder

echo "********************************************************************************"
echo "Backup MyDocuments to $PROTON_DRIVE/MyDocuments.backup"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
/Users/chris/MyDocuments/ $PROTON_DRIVE/MyDocuments.backup

echo "********************************************************************************"
echo "Backup scripts to $PROTON_DRIVE/scripts.backup"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/scripts/" $PROTON_DRIVE/scripts.backup

echo "********************************************************************************"
echo "Backup playbooks to $PROTON_DRIVE/playbooks.backup"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
"/Users/chris/playbooks/" $PROTON_DRIVE/playbooks.backup
