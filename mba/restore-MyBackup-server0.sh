#!/bin/bash
echo "********************************************************************************"
export SSH_USER=chris@server0
export SRCPATH=/home/chris/chris-mbp
echo "syncing Home Directory to Server0"

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
$SSH_USER:$SRCPATH/MyDocuments/ ~/MyDocuments

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
$SSH_USER:$SRCPATH/playbooks/ ~/playbooks

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
$SSH_USER:$SRCPATH/scripts/ ~/scripts

rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
$SSH_USER:$SRCPATH/Books/ ~/Books 

export SRCPATH=/export/backup/chris-mbp

#rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
#$SSH_USER:$SRCPATH/Music/ ~/Music.localized

#rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
#$SSH_USER:$SRCPATH/HomeVideos/ ~/Movies/TV/Media.localized/Home\ Videos

#
# RESTORING PHOTOS THIS WAY DOESN'T WORK UNLESS YOU DELETE EXISTING PHOTOS FIRST
#
rsync -e ssh -aHKvz --delete --delete-excluded --delete-during --progress \
$SSH_USER:$SRCPATH/Pictures/ ~/Pictures

