#!/bin/bash
#echo "********************************************************************************"
#echo "* Syncing Home Directory from Diskstation                                      *"
#echo "********************************************************************************"
#rsync --no-perms -rlptDHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--exclude "Network Trash Folder" \
#--exclude "Temporary Items" \
#--exclude "VirtualMachines" \
#--exclude "VirtualBoxVMs" \
#--exclude "iTunesMedia" \
#--exclude "*.winclone" \
#--exclude "#recycle" \
#--exclude "\@eaDir*" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#--executability \
#chris@diskstation:/volume2/homes/chris/ /Volumes/chris/ds-home

echo "********************************************************************************"
echo "* Syncing Archive from Diskstation                                             *"
echo "********************************************************************************"
rsync --no-perms -rlptDHKz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "#recycle" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
--executability \
chris@diskstation:/volume1/Archive/ /Volumes/Data/Archive

echo "********************************************************************************"
echo "* Syncing ISOs from Diskstation                                                *"
echo "********************************************************************************"
rsync --no-perms -rlptDHKz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "#recycle" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
--executability \
chris@diskstation:/volume2/ISOs/ /Volumes/Data/ISOs
