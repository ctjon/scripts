#!/bin/sh
export BACKUP_DIR=/media/Backup/apollo/
export ARCHIVE_DIR=/archive

date
echo "Backing up MP3 Files"
cd $ARCHIVE_DIR
tar -cpzf $BACKUP_DIR/mp3_Music.tar.gz mp3_Music
chown -R chris:chris $BACKUP_DIR/mp3_Music.tar.gz
chmod 600 $BACKUP_DIR/mp3_Music.tar.gz
ls -l $BACKUP_DIR
df -k $BACKUP_DIR
date
