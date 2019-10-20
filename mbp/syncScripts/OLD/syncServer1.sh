#!/bin/bash
#rsync -aHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#chris@server1.internal.tjon.net:/home/chris/ /Volumes/LaCie\ 1TB/chris

#rsync -aHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#chris@server1.internal.tjon.net:/export/www/ /Volumes/LaCie\ 1TB/www

#rsync -aHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#chris@server1.internal.tjon.net:/export/archive/ /Volumes/LaCie\ 1TB/Archive

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--keep-dirlinks \
--delete-excluded \
--delete-during \
--progress \
chris@server1.internal.tjon.net:/export/isos/ /Volumes/LaCie\ 1TB/ISOs

#rsync -aHKvz \
#--exclude=".*" \
#--exclude "lost+found" \
#--keep-dirlinks \
#--delete-excluded \
#--delete-during \
#--progress \
#chris@server1.internal.tjon.net:/export/install/ /Volumes/LaCie\ 1TB/Install
