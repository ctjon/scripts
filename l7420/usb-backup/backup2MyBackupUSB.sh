#!/bin/bash

USB_DISK=/var/run/media/chris/MyBackupUSB
EXCLUDES=/home/chris/scripts/l7420/usb-backup/backup-excludes.txt

echo "********************************************************************************"
export USB_TGT=$USB_DISK/MyDocuments.backup
echo "Backup MyDocuments to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g --progress \
--exclude-from "$EXCLUDES" \
~/MyDocuments/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Books.backup
echo "Backup Books to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g --progress \
--exclude-from "$EXCLUDES" \
~/Books/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/HomeVideos.backup
echo "Backup HomeVideos to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g --progress \
--exclude-from "$EXCLUDES" \
~/HomeVideos/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/scripts.backup
echo "Backup scripts to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/scripts/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/playbooks.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/playbooks/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Music.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/Music/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/AppleMusic.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/AppleMusic/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/ApplePhotos.backup
echo "Backup playbooks to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/ApplePhotos/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/thinkorswim.backup
echo "Backup thinkorswim to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--exclude-from "$EXCLUDES" \
--progress --exclude=.DS_Store \
~/thinkorswim/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/dotfiles.backup
echo "Backup Config Files to $USB_TGT"
rsync -e ssh -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g --progress \
  --include='/.ssh/***' \
  --include='/.ansible.cfg' \
  --include='/.gitconfig' \
  --include='/.bashrc' \
  --include='/.bash_profile' \
  --exclude='*' \
  ~/ $USB_TGT

echo "********************************************************************************"
export USB_TGT=$USB_DISK/Pictures.backup
echo "Backup Pictures to $USB_TGT"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress --exclude=.DS_Store \
--exclude-from "$EXCLUDES" \
~/Pictures/ $USB_TGT

