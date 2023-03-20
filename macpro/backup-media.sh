#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
--exclude="VirtualMachines" \
/Volumes/Media/ /Volumes/Media-Backup

