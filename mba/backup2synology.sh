#!/bin/bash
export BACKUP_HOST=chris@ds224.local

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/MyDocuments.backup
echo "Backup MyDocuments to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/MyDocuments/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/Books.backup
echo "Backup Books to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/Library/Mobile Documents/com~apple~CloudDocs/Books/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/HomeVideos.backup
echo "Backup HomeVideos to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/Library/Mobile Documents/com~apple~CloudDocs/HomeVideos/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/Music.backup
echo "Backup Music to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/Music/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/scripts.backup
echo "Backup scripts to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/scripts/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/playbooks.backup
echo "Backup playbooks to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/playbooks/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/thinkorswim.backup
echo "Backup thinkorswim to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/thinkorswim/" $BACKUP_TARGET

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/dotfiles.backup
echo "Backup Config Files to $BACKUP_TARGET"
rsync -aHKvz --delete --delete-excluded --delete-during --progress \
--exclude=.DS_Store \
--exclude=.Trash \
--exclude=.zsh_sessions \
~/.[^.]*  $BACKUP_TARGET
#--exclude=.config/containers \
#--exclude=.local/share/containers \

echo "********************************************************************************"
export BACKUP_TARGET=$BACKUP_HOST:/volume1/Chris/Pictures.backup
echo "Backup Pictures to $BACKUP_TARGET"
rsync -aHKvzO --delete --delete-excluded --delete-during --no-o --no-g \
--progress -e ssh --exclude=.DS_Store \
"/Users/chris/Pictures/" $BACKUP_TARGET

