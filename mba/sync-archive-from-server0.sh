#!/bin/bash
#rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/mbp-data/Archive/ chris@server0:/export/archive
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded chris@server0:/export/archive/ /Volumes/mbp-data/Archive/
