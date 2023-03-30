#!/bin/bash
echo "********************************************************************************"
export SSH_USER=chris@server0
export TGTPATH=/home/chris/chris-mbp
echo "syncing Home Directory to Server0"

ssh $SSH_USER mkdir $TGTPATH

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/MyDocuments/ $SSH_USER:$TGTPATH/MyDocuments

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/playbooks/ $SSH_USER:$TGTPATH/playbooks

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/scripts/ $SSH_USER:$TGTPATH/scripts

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/Books/ $SSH_USER:$TGTPATH/Books

export TGTPATH=/export/backup/chris-mbp

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/Pictures/ $SSH_USER:$TGTPATH/Pictures

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/Music/ $SSH_USER:$TGTPATH/Music

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
~/Movies/TV/Home\ Videos/ $SSH_USER:$TGTPATH/HomeVideos

ssh $SSH_USER touch $TGTPATH/timestamp
