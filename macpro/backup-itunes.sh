#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Media/iTunesLibrary/ /Volumes/Backup/iTunesBackup
