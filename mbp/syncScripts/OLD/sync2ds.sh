#!/bin/bash

#rsync -aOHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#/Volumes/LaCie\ 1TB/chris/ chris@diskstation:/volume3/chris

#rsync -aOHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#/Volumes/LaCie\ 1TB/www/ chris@diskstation:/volume9/www

echo "********************************************************************************"
echo "* Syncing Archive                                                              *"
echo "********************************************************************************"

rsync -aOHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/Archive/ chris@diskstation:/volume1/Archive

echo "********************************************************************************"
echo "* Syncing ISOs                                                                 *"
echo "********************************************************************************"
rsync -aOHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/ISOs/ chris@diskstation:/volume2/ISOs 

#echo "********************************************************************************"
#echo "* Syncing VirtualMachines                                                      *"
#echo "********************************************************************************"
#rsync -aOHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--exclude "Network Trash Folder" \
#--exclude "Temporary Items" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#/Volumes/LaCie1TB/VirtualMachines/ chris@diskstation:/volume9/home/VirtualMachines 
#
#echo "********************************************************************************"
#echo "* Syncing VirtualBoxVMs                                                        *"
#echo "********************************************************************************"
#rsync -aOHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
####/Volumes/LaCie1TB/VirtualBoxVMs/ chris@diskstation:/volume9/home/VirtualBoxVMs 
