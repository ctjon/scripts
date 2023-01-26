#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Install/ /Volumes/Backup/Install-backup
