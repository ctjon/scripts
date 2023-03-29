#!/bin/bash
echo "********************************************************************************"
export SSH_USER=chris@server0
export TGTPATH=/home/chris/chris-mbp
echo "syncing Home Directory to Server0"

ssh $SSH_USER mkdir $TGTPATH

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/MyDocuments/ $SSH_USER:$TGTPATH/MyDocuments

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/playbooks/ $SSH_USER:$TGTPATH/playbooks

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/scripts/ $SSH_USER:$TGTPATH/scripts

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Books/ $SSH_USER:$TGTPATH/Books

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~chris/Pictures/ $SSH_USER:$TGTPATH/Pictures

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/Music/ $SSH_USER:$TGTPATH/Music

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
/Volumes/Media/HomeVideos/ $SSH_USER:$TGTPATH/HomeVideos

ssh $SSH_USER touch $TGTPATH/timestamp
