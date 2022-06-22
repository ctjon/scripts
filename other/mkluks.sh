#!/bin/bash
echo "DONT RUN ME WITHOUT READING/MODIFYING"
exit 0

sudo fdisk /dev/sdX
sudo parted /dev/sdX
sudo partprobe
cat /proc/partitions
sudo cryptsetup luksFormat /dev/sdX1
sudo cryptsetup luksOpen /dev/sdX1 MyEncryptedDisk
ls -l /dev/mapper
sudo mkfs.ext4 /dev/mapper/MyEncryptedDisk 
sudo e2label /dev/dm-9 MyEncryptedDisk
sudo cryptsetup luksClose /dev/mapper/MyEncryptedDisk
