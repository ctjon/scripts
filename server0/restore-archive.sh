#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /export/backup/server0/archive/ /export/archive 
