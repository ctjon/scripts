#!/bin/bash
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=".*" \
--delete-excluded \
/Volumes/Archive/ /Volumes/Data/Archive
