#!/bin/bash
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
--exclude="VirtualMachines" \
/Volumes/Media/ chris@server0:/export/backup/chris-mbp/media

