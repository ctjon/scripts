#!/bin/bash
rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Volumes/LaCie2TB/mbpfull  /Volumes/iTunes
