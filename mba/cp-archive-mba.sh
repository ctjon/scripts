#!/bin/bash
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="\@*" \
--exclude="\#*" \
chris@server0:/export/archive/ /Volumes/Archive

