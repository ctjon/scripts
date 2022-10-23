#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/4TB-NVMe/Install/ chris@server0:/export/install 
