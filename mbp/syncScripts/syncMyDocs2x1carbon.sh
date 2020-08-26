#!/bin/bash
export X1CARBONIP=172.16.1.169

echo "********************************************************************************"
echo "syncing MyDocuments to x1carbon"
touch ~chris/MyDocuments/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/MyDocuments/ chris@$X1CARBONIP:~/MyDocuments

echo "********************************************************************************"
echo "syncing Downloads to x1carbon"
touch ~chris/Downloads/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Downloads/ chris@$X1CARBONIP:/home/chris/Downloads/mbp

#echo "********************************************************************************"
#echo "syncing GoogleDrive to x1carbon"
#touch ~chris/Google\ Drive/timestamp
#rsync -e ssh -aHKz \
#--exclude=".*" \
#--exclude "lost+found" \
#--delete-excluded \
#--progress \
#~chris/Google\ Drive/ /Volumes/DocumentsUSB/GoogleDrive/

echo "********************************************************************************"
echo "syncing Pictures to x1carbon"
touch ~chris/Pictures/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Pictures/ chris@$X1CARBONIP:/home/chris/Pictures

echo "********************************************************************************"
echo "syncing Movies to x1carbon"
touch ~chris/Movies/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Movies/ chris@$X1CARBONIP:/home/chris/Movies

echo "********************************************************************************"
echo "syncing Music to x1carbon"
#mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Music
touch ~chris/Music/iTunes/iTunes\ Media/Music/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/iTunes/iTunes\ Media/Music/ chris@$X1CARBONIP:/home/chris/Music

echo "********************************************************************************"
echo "syncing Home Videos to x1carbon"
#mkdir -p /Volumes/DocumentsUSB/iTunes\ Media/Home\ Videos
touch ~chris/Music/iTunes/iTunes\ Media/Home\ Videos/timestamp
rsync -e ssh -aHKz \
--exclude=".*" \
--exclude "lost+found" \
--delete-excluded \
--progress \
~chris/Music/iTunes/iTunes\ Media/Home\ Videos/ chris@$X1CARBONIP:/home/chris/HomeVideos

#echo "********************************************************************************"
#echo "syncing Select VMs to x1carbon"
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
