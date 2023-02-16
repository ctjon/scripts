 #!/bin/bash
 #
echo "DONT RUN ME WITHOUT READING/MODIFYING"
exit 0

lsblk
sudo parted /dev/sdd
sudo cryptsetup -h sha256 -c aes-xts-plain -s 256 luksFormat /dev/sdd1
sudo cryptsetup luksOpen /dev/sdd1 MyBackupUSB
sudo mkfs.xfs /dev/mapper/MyBackupUSB 
sudo xfs_admin -L MyBackupUSB /dev/mapper/MyBackupUSB 
sudo cryptsetup luksClose /dev/mapper/MyBackupUSB
