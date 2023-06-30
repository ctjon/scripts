#!/bin/bash
echo "********************************************************************************"
export USBPATH=/run/media/chris/MyBackupUSB
echo "syncing Home Directory to USB"

mkdir -p $USBPATH/homedir
touch $USBPATH/homedir/timestamp

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
~chris/pCloudDrive/ $USBPATH/homedir/pCloudDrive

#rsync -aHKvz --delete --delete-excluded --delete-during --progress \
#--exclude=".DS_Store" \
#~chris/MyDocuments/ $USBPATH/homedir/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=".DS_Store" \
~chris/playbooks/ $USBPATH/homedir/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=".DS_Store" \
~chris/scripts/ $USBPATH/homedir/scripts

#rsync -aHKvz --delete --delete-excluded --delete-during --progress \
#--exclude=".DS_Store" \
#~chris/scripts.old/ $USBPATH/homedir/scripts.old

#rsync -aHKvz --delete --delete-excluded --delete-during --progress \
#--exclude=".DS_Store" \
#~chris/Books.backup/ $USBPATH/homedir/Books.backup

#rsync -aHKvz --delete --delete-excluded --delete-during --progress \
#--exclude=".DS_Store" \
#~chris/Pictures/ $USBPATH/homedir/Pictures
