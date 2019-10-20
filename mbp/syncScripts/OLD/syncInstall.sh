#!/bin/bash

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
chris@diskstation:/volume2/Install/Linux/centos* /Volumes/mbaext/Users/chris/Downloads/Install/Linux/
#
rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
chris@diskstation:/volume2/Install/Linux/centos* /Volumes/mbaext/Users/chris/Downloads/Install/Linux/
