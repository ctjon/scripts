#!/bin/bash
rsync -aHKv --keep-dirlinks --rogress --delete --exclude=".*" --delete-excluded /export/backup/server0/archive/ /export/archive 
