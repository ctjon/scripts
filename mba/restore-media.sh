#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --delete-excluded  \
--exclude=".*" \
--exclude="iOS-Backups" \
/Volumes/mbp-media-backup/ /Volumes/mbp-media
