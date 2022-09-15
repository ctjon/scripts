#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Backup/Install-backup/ /Volumes/4TB-NVMe/Install 
