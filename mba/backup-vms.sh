#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded ~/Parallels/ /Volumes/VM-Backups/mba
