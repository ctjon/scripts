#!/bin/bash
#echo "********************************************************************************"
#echo "* Syncing Home Directory from Diskstation                                      *"
#echo "********************************************************************************"
#rsync -aHKvz \
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
#chris@diskstation:/volume2/homes/chris/ /Volumes/LaCie1TB/ds-home

echo "********************************************************************************"
echo "* Syncing Archive from Diskstation                                             *"
echo "********************************************************************************"
rsync -aHKvz \
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
chris@diskstation:/volume2/Archive/ /Volumes/LaCie1TB/Archive

echo "********************************************************************************"
echo "* Syncing ISOs from Diskstation                                                *"
echo "********************************************************************************"
rsync -aHKvz \
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
chris@diskstation:/volume2/ISOs/ /Volumes/LaCie1TB/ISOs
