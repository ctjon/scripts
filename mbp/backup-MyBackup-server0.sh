#!/bin/bash
echo "********************************************************************************"
export TGTPATH=chris@server0:/home/chris/chris-mbp
echo "syncing Home Directory to Server0"
ssh chris@server0 "mkdir $TGTPATH"

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $TGTPATH/MyDocuments

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $TGTPATH/playbooks

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $TGTPATH/scripts

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books/ $TGTPATH/Books

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Pictures/ $TGTPATH/Pictures

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/Music/ $TGTPATH/Music

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/HomeVideos/ $TGTPATH/HomeVideos

touch $TGTPATH/timestamp
