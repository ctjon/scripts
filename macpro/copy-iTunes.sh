#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /mnt/usb/iTunes/ chris@server0:/export/iTunes
