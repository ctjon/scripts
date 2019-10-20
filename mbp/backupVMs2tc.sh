#!/bin/bash
rsync -aqHKvvz --no-o --no-g \
--exclude=".*" \
--exclude "lost+found" \
--exclude "Network Trash Folder" \
--exclude "Temporary Items" \
--exclude "\@eaDir*" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
/Users/chris/VirtualMachines/ /Volumes/chris/VirtualMachines
