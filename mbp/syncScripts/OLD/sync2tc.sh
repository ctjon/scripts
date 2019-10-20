#!/bin/bash

rsync -aHKvz --no-o --no-g \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/Archive/ /Volumes/Data/Archive

rsync -aHKvz --no-o --no-g \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/ISOs/ /Volumes/Data/ISOs

rsync -aHKvz --no-o --no-g \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/centos-source/ /Volumes/Data/centos-source

rsync -aHKvz --no-o --no-g \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Volumes/LaCie1TB/centos-debuginfo/ /Volumes/Data/centos-debuginfo

