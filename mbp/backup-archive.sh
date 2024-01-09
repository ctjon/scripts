#!/bin/bash
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
--exclude="VirtualMachines" \
/Volumes/mbp-data/Archive/ /Volumes/Media/Archive

