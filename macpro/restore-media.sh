#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
/Volumes/Media-Backup/ /Volumes/Media
