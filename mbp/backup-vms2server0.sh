#!/bin/bash
ssh chris@server0 mkdir -p /export/backup/mbp/VirtualMachines
rsync -aHKv -e ssh --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/mbp-data/VirtualMachines/ chris@server0:/export/backup/mbp/VirtualMachines
