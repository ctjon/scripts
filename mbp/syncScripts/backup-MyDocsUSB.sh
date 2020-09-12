#!/bin/bash
echo "********************************************************************************"
echo "syncing MyDocuments to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/MyDocuments/ /Volumes/MyDocumentsUSB/MyDocuments/
touch /Volumes/MyDocumentsUSB/MyDocuments/timestamp
echo "********************************************************************************"

echo "syncing iCloudDrive to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Library/Mobile\ Documents/com~apple~CloudDocs/ /Volumes/MyDocumentsUSB/iCloudDrive/
touch ~/Library/Mobile\ Documents/com~apple~CloudDocs/timestamp
echo "********************************************************************************"

echo "syncing OneDrive to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/OneDrive\ -\ tjon.net/ /Volumes/MyDocumentsUSB/OneDrive\ -\ tjon.net/
touch /Volumes/MyDocumentsUSB/OneDrive\ -\ tjon.net/timestamp

echo "********************************************************************************"
echo "syncing scripts to USB"
mkdir -p /Volumes/MyDocumentsUSB/scripts
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/scripts/ /Volumes/MyDocumentsUSB/scripts
touch /Volumes/MyDocumentsUSB/scripts/timestamp

echo "********************************************************************************"
echo "syncing playbooks to USB"
mkdir -p /Volumes/MyDocumentsUSB/playbooks
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/playbooks/ /Volumes/MyDocumentsUSB/playbooks
touch /Volumes/MyDocumentsUSB/playbooks/timestamp

echo "********************************************************************************"
echo "syncing Downloads to USB"
mkdir -p /Volumes/MyDocumentsUSB/Downloads
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Downloads/ /Volumes/MyDocumentsUSB/Downloads
touch /Volumes/MyDocumentsUSB/Downloads/timestamp

#echo "********************************************************************************"
#echo "syncing GoogleDrive to USB"
#rsync -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Google\ Drive/ /Volumes/MyDocumentsUSB/GoogleDrive/
#touch /Volumes/MyDocumentsUSB/GoogleDrive/timestamp

echo "********************************************************************************"
echo "syncing Pictures to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Pictures/ /Volumes/MyDocumentsUSB/Pictures/
touch /Volumes/MyDocumentsUSB/Pictures/timestamp

echo "********************************************************************************"
echo "syncing Music to USB"
mkdir -p /Volumes/MyDocumentsUSB/Music
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/ /Volumes/MyDocumentsUSB/Music
touch /Volumes/MyDocumentsUSB/Music/timestamp

