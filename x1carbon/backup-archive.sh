#!/bin/bash
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=".*" \
--delete-excluded \
chris@server0:/export/archive/ /opt/local/archive
#/run/media/chris/Archive/ /run/media/chris/Backup/archive
