#!/bin/bash
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
--exclude="VirtualMachines" \
--exclude="Archive" \
/Volumes/Media/ /Volumes/Seagate-5TB

