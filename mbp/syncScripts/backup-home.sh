#!/bin/bash
echo "syncing ~chris to external drive"
rsync -aHKz \
--exclude "lost+found" \
--exclude "VirtualMachines" \
--delete-excluded \
--progress \
~chris/ /Volumes/Chris-TM/chris
touch /Volumes/Chris-TM/chris/timestamp
