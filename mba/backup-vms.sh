#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/mbp-data/VirtualMachines/ /Volumes/Media/VirtualMachines
