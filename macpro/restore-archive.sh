#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Backup/Archive-backup/ /Volumes/4TB-NVMe/Archive 
