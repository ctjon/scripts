#!/bin/bash
echo "*******************************************************************************"
echo "syncing /Volumes/SBF4TB/Pictures"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Users/chris/Pictures/ \
--exclude=.* \
--delete-excluded \
/Volumes/SBF4TB/Pictures 

echo "*******************************************************************************"
echo "syncing /Volumes/chris/Pictures"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Users/chris/Pictures/ \
--exclude=.* \
--delete-excluded \
/Volumes/chris/Pictures
