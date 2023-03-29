#!/bin/bash
echo "********************************************************************************"
export TGTPATH=chris@server0:/home/chris-mbp/MyBackup-mbp
echo "syncing Home Directory to Server0"
ssh chris@server0 "mkdir $TGTPATH"

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $TGTPATH/MyDocuments

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $TGTPATH/playbooks

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $TGTPATH/scripts

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books/ $TGTPATH/Books

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Pictures/ $TGTPATH/Pictures

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/Music/ $TGTPATH/Music

rsync -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/HomeVideos/ $TGTPATH/HomeVideos

touch $TGTPATH/timestamp
