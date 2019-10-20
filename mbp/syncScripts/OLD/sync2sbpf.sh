#!/bin/bash
rsync -aHKv \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Volumes/MyBookData/ /Volumes/SBPF4TB-Data

