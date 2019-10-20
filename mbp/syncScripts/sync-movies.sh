#!/bin/bash
echo "*******************************************************************************"
echo "syncing /Volumes/SBF4TB/Movies"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Users/chris/Movies/ \
--exclude=.* \
--delete-excluded \
/Volumes/SBF4TB/Movies 

echo "*******************************************************************************"
echo "syncing /Volumes/chris/Movies"
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Users/chris/Movies/ \
--exclude=.* \
--delete-excluded \
/Volumes/chris/Movies
