#!/bin/bash
echo "********************************************************************************"
export SRCPATH="/Users/chris/pCloud Drive/Crypto Folder/MyDocuments.backup/"
export TGTPATH="/Users/chris/MyDocuments"

echo "syncing $SRCPATH to $TGTPATH"

mkdir -p $TGTPATH

if mount | grep /Users/chris/pCloud\ Drive > /dev/null; then
    echo "pCloud Drive Mounted"
else
    echo "pCloud Drive Not Mounted!"
    exit -1;
fi

if touch /Users/chris/pCloud\ Drive/Crypto\ Folder/timestamp > /dev/null; then
    echo "CryptoFolder Open"
else
    echo "CryptoFolder Closed!"
    exit -1;
fi

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=".DS_Store" \
"$SRCPATH" $TGTPATH
#"/Users/chris/pCloud Drive/Crypto Folder/MyDocuments/" "/Users/chris/MyDocuments"

