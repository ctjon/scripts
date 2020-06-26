#!/bin/bash

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@server0:/export/archive/ \
--exclude=.* \
--delete-excluded \
/Volumes/Archive


