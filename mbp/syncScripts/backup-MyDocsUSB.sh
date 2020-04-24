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

echo "syncing OneDrive to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/OneDrive\ -\ tjon.net/ /Volumes/MyDocumentsUSB/OneDrive\ -\ tjon.net//
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

#echo "********************************************************************************"
#echo "syncing Movies to USB"
#rsync -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Movies/ /Volumes/MyDocumentsUSB/Movies/

echo "********************************************************************************"
echo "syncing Music to USB"
mkdir -p /Volumes/MyDocumentsUSB/Music
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/Music/ /Volumes/MyDocumentsUSB/Music
touch /Volumes/MyDocumentsUSB/Music/timestamp

echo "********************************************************************************"
echo "syncing Home Videos to USB"
mkdir -p /Volumes/MyDocumentsUSB/HomeVideos
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
/Volumes/MediaLibrary/TV/Media/Home\ Videos/ /Volumes/MyDocumentsUSB/HomeVideos
touch /Volumes/MyDocumentsUSB/HomeVideos/timestamp
