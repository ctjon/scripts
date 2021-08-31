#!/bin/bash
rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
/Volumes/Data-RAID10/TV \
--exclude=.* \
--delete-excluded \
/Volumes/iTunesLibraryUSB/

