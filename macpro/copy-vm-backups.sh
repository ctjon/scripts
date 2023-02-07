#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Backup/VirtualMachineImages/ chris@server0:/export/backup/VirtualMachineImages
