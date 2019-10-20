#!/bin/bash
rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
chris@172.16.1.2:/export/www/ /Volumes/FreeAgentGoFlex/www

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
chris@172.16.1.2:/export/isos/ /Volumes/FreeAgentGoFlex/ISOs

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "win7mba" \
--delete-excluded \
--progress \
chris@172.16.1.2:/export/archive/ /Volumes/FreeAgentGoFlex/Archive

rsync -aHKvz \
--exclude=".*" \
--exclude "lost+found" \
--exclude "VirtualBoxVMs" \
--delete-excluded \
--progress \
chris@172.16.1.2:/home/chris/ /Volumes/FreeAgentGoFlex/chris
