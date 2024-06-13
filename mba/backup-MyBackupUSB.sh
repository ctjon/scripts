#!/bin/bash
echo "********************************************************************************"
export USBPATH=/Volumes/MyBackupUSB
echo "syncing Home Directory to USB"
mkdir  $USBPATH/homedir

echo "Backing up iCloudDrive"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
~/Library/Mobile\ Documents/com~apple~CloudDocs/ $USBPATH/homedir/iCloudDrive

echo "Backing up ProtonDrive"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
~/Library/CloudStorage/ProtonDrive-chris.tjon@pm.me/ $USBPATH/homedir/ProtonDrive

echo "Backing up config files"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
--exclude=.zsh_sessions \
~/.[^.]*  $USBPATH/homedir/dotfiles

echo "Backing up ThinkOrSwim"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/thinkorswim/  $USBPATH/homedir/thinkorswim

echo "Backing up playbooks"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/playbooks/ $USBPATH/homedir/playbooks

echo "Backing up scripts"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/scripts/ $USBPATH/homedir/scripts

echo "Backing up Music"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Music/ $USBPATH/homedir/Music

echo "Backing up Pictures"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
~/Pictures/ $USBPATH/homedir/Pictures

touch $USBPATH/homedir/timestamp
