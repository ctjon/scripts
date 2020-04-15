#!/bin/bash
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--exclude=".*" \
--delete-excluded \
/Users/chris/VirtualMachines/ /Volumes/Data/VirtualMachines
