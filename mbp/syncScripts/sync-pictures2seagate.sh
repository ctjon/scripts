#!/bin/bash

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
/Users/chris/Pictures/ \
--exclude=.* \
--delete-excluded \
/Volumes/SBF4TB/Pictures
exit

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
/Volumes/Archive/ \
--exclude=.* \
--delete-excluded \
chris@server0:/export/archive

rsync -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
/Volumes/Archive/ \
--exclude=.* \
--delete-excluded \
/Volumes/timecapsule/Archive

