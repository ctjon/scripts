#!/bin/bash

# Grab the primary interface's IP (the one holding the default route)
MY_SUBNET=$(ip -4 addr show scope global | awk '/inet 172\.16\./{print $2}')
case "$MY_SUBNET" in
  172.16.1.*)  SYNO_HOST=synologyaz.local ;;
  172.16.2.*)  SYNO_HOST=synologynd.local ;;
esac

echo "********************************************************************************"
echo "Backing up to $SYNO_HOST <<<<<<<<<<<<<<<<"

SRC_HOST=`hostname -s`
EXCLUDES=/home/chris/scripts/l7420/synology-backup/backup-excludes.txt
SYNO_USER=chris
SYNO_PATH=/var/services/homes/chris/Backup.$SRC_HOST
SYNO_DISK=$SYNO_USER@$SYNO_HOST:$SYNO_PATH

# self-healing: ensure the backup root exists
ssh $SYNO_USER@$SYNO_HOST "mkdir -p $SYNO_PATH"

declare -a JOBS=(
  "$HOME/MyDocuments:MyDocuments.backup"
  "$HOME/Books:Books.backup"
  "$HOME/HomeVideos:HomeVideos.backup"
  "$HOME/scripts:scripts.backup"
  "$HOME/playbooks:playbooks.backup"
  "$HOME/AppleMusic:AppleMusic.backup"
  "$HOME/Music:Music.backup"
  "$HOME/ApplePhotos:ApplePhotos.backup"
  "$HOME/thinkorswim:thinkorswim.backup"
  "$HOME/Pictures:Pictures.backup"
)

for job in "${JOBS[@]}"; do
  src="${job%%:*}"; dest="${job#*:}"
  echo "*************************************************************************"
  echo "Backing up $src to $dest"
  rsync -e ssh -aHKvzO --chmod=D700,F600 --delete --delete-excluded \
    --delete-during --no-o --no-g --progress \
    --exclude-from "$EXCLUDES" "$src"/ "$SYNO_USER@$SYNO_HOST:$SYNO_PATH/$dest" || echo "FAILED: $src"
done

echo "********************************************************************************"
echo "Backup Config Files to $SYNO_PATH/dotfiles.backup"
rsync -e ssh -aHKvzO --chmod=D700,F600 --delete --delete-excluded --delete-during \
  --no-o --no-g --progress \
  --include='/.ssh/***' \
  --include='/.ansible.cfg' \
  --include='/.gitconfig' \
  --include='/.bashrc' \
  --include='/.bash_profile' \
  --exclude='*' \
  ~/ "$SYNO_USER@$SYNO_HOST:$SYNO_PATH/dotfiles.backup"

