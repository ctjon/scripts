#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/4TB-NVMe/Install/ /Volumes/Backup/Install-backup
