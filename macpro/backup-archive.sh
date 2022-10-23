#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/4TB-NVMe/Archive/ /Volumes/Backup/Archive-backup
