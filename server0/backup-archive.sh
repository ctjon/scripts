#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /export/archive/ /export/backup/server0/archive
