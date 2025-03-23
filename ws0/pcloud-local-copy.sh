#!/bin/bash
echo "********************************************************************************"
export SRCPATH=/home/chris/pCloudDrive
export TGTPATH=/export/rbackup/chris/pCloudDrive.local

echo "syncing Home Directory to USB"

mkdir -p $TGTPATH

if mount | grep /home/chris/pCloudDrive > /dev/null; then
    echo "pCloudDrive Mounted"
else
    echo "pCloudDrive Not Mounted!"
    exit -1;
fi

if touch /home/chris/pCloudDrive/Crypto\ Folder/timestamp > /dev/null; then
    echo "CryptoFolder Open"
else
    echo "CryptoFolder Closed!"
    exit -1;
fi

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=".DS_Store" \
$SRCPATH/ $TGTPATH

touch $TGTPATH/timestamp
