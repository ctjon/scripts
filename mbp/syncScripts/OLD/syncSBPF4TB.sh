#!/bin/bash
rsync -aHKvz \
--exclude=".*" \
--exclude="lost+found" \
--exclude="VirtualMachines" \
--exclude="Backups.backupdb" \
--delete-excluded \
--progress \
/Volumes/SBPF4TB/ /Volumes/MyBookStudio
