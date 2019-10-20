#!/bin/bash
echo "********************************************************************************"
echo "syncing MyDocuments to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/MyDocuments/ /Volumes/DocumentsUSB/MyDocuments/
touch /Volumes/DocumentsUSB/MyDocuments/timestamp

echo "********************************************************************************"
echo "syncing Downloads to USB"
mkdir -p /Volumes/DocumentsUSB/Downloads
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Downloads/ /Volumes/DocumentsUSB/Downloads
touch /Volumes/DocumentsUSB/Downloads/timestamp

echo "********************************************************************************"
echo "syncing GoogleDrive to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Google\ Drive/ /Volumes/DocumentsUSB/GoogleDrive/
touch /Volumes/DocumentsUSB/GoogleDrive/timestamp

echo "********************************************************************************"
echo "syncing Pictures to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Pictures/ /Volumes/DocumentsUSB/Pictures/
touch /Volumes/DocumentsUSB/Pictures/timestamp

echo "********************************************************************************"
echo "syncing Movies to USB"
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Movies/ /Volumes/DocumentsUSB/Movies/

echo "********************************************************************************"
echo "syncing Music to USB"
mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Music
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/iTunes/iTunes\ Media/Music/ /Volumes/DocumentsUSB/iTunes\ Media/Music
touch /Volumes/DocumentsUSB/iTunes\ Media/Music/timestamp

echo "********************************************************************************"
echo "syncing Home Videos to USB"
mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Home\ Videos
rsync -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/iTunes/iTunes\ Media/Home\ Videos/ /Volumes/DocumentsUSB/iTunes\ Media/Home\ Videos
touch /Volumes/DocumentsUSB/iTunes\ Media/Home\ Videos/timestamp

#echo "********************************************************************************"
#echo "syncing Select VMs to USB"
#for i in trpc.vmwarevm Win10x64vm.vmwarevm
#do 
#  rsync -aHKz \
#  --exclude=".*" \
#  --exclude "lost+found" \
#  --delete-excluded \
#  --progress \
#  ~chris/VirtualMachines/$i /Volumes/DocumentsUSB/VirtualMachines/
#done
#echo "********************************************************************************"
