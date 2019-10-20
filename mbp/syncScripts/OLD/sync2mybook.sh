#!/bin/bash
rsync -aHKv \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Volumes/SBPF4TB-Data/ /Volumes/MyBook4TB
