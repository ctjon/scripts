#!/bin/bash
echo "********************************************************************************"
echo "syncing Books to pCloud"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
/run/media/chris/MyBackupUSB/homedir/pCloudDrive/Books/ ~chris/Books
touch ~chris/Books/timestamp
