#!/bin/bash

echo "Backing up gatekeeper:/home/chris/ConfigFiles"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@172.16.1.251:/home/chris/ConfigFiles/ \
--exclude='.*' \
--delete-excluded \
~chris/MyDocuments/TechStuff/Config-Backups/configs-gatekeeper

echo "Backing up gatekeeper:/home/chris/scripts"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@172.16.1.251:/home/chris/scripts/ \
--exclude='.*' \
--delete-excluded \
~chris/MyDocuments/TechStuff/Config-Backups/scripts-gatekeeper

echo "Backing up server0:/home/chris/ConfigFiles"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@server0:/home/chris/ConfigFiles/ \
--exclude='.*' \
--delete-excluded \
~chris/MyDocuments/TechStuff/Config-Backups/configs-server0

echo "Backing up server0:/home/chris/scripts"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
chris@server0:/home/chris/scripts/ \
--exclude='.*' \
--delete-excluded \
~chris/MyDocuments/TechStuff/Config-Backups/scripts-server0

