#!/bin/bash
echo "********************************************************************************"
echo "syncing MyDocuments to server0"
touch ~chris/MyDocuments/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/MyDocuments/ chris@server0.internal.tjon.net:/home/chris/MyDocuments

echo "********************************************************************************"
echo "syncing Downloads to server0"
touch ~chris/Downloads/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Downloads/ chris@server0.internal.tjon.net:/home/chris/Downloads/mbp

#echo "********************************************************************************"
#echo "syncing GoogleDrive to server0"
#touch ~chris/Google\ Drive/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Google\ Drive/ /Volumes/DocumentsUSB/GoogleDrive/

#echo "********************************************************************************"
#echo "syncing Pictures to server0"
#touch ~chris/Pictures/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Pictures/ chris@server0.internal.tjon.net:/home/chris/Pictures

#echo "********************************************************************************"
#echo "syncing Movies to server0"
#touch ~chris/Movies/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Movies/ chris@server0.internal.tjon.net:/home/chris/Movies

#echo "********************************************************************************"
#echo "syncing Music to server0"
##mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Music
#touch ~chris/Music/iTunes/iTunes\ Media/Music/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Music/iTunes/iTunes\ Media/Music/ chris@server0.internal.tjon.net:/home/chris/Music

#echo "********************************************************************************"
#echo "syncing Home Videos to server0"
##mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Home\ Videos
#touch ~chris/Music/iTunes/iTunes\ Media/Home\ Videos/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Music/iTunes/iTunes\ Media/Home\ Videos/ chris@server0.internal.tjon.net:/home/chris/HomeVideos

#echo "********************************************************************************"
#echo "syncing Select VMs to server0"
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
