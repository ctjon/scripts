#!/bin/bash
export USBPATH=/run/media/chris/MyBackupUSB/homedir
export TFTPBOOT_BKUP=/home/chris/MyDocuments/TechStuff/Config-Backups/tftpboot
export KSCONFIGS_BKUP=/home/chris/MyDocuments/TechStuff/Config-Backups/ks-configs

grive -p ~/GoogleDrive

echo "********************************************************************************"
echo "Backup Up /var/lib/tftpboot"
mkdir -p $TFTPBOOT_BKUP
rsync -aHKz \
/var/lib/tftpboot/{images,pxelinux.cfg} \
--delete --progress \
$TFTPBOOT_BKUP

echo "********************************************************************************"
echo "Backup Up /export/install/Linux/ks-configs"
mkdir -p $KSCONFIGS_BKUP
rsync -aHKz \
/export/install/Linux/ks-configs/ \
--delete --progress \
$KSCONFIGS_BKUP

echo "********************************************************************************"
echo "syncing Home Directory to USB"
rsync -aHKz \
--exclude="vmware" \
--exclude="VirtualMachines" \
--exclude="kvm-vms" \
--exclude "lost+found" \
--exclude ".cache" \
--exclude "*.crdownload" \
--exclude ".ccache" \
--exclude ".local/share/Trash" \
--exclude "RhDocuments/.trash" \
--delete-excluded \
--delete --delete-during --progress \
~chris/ $USBPATH
touch $USBPATH/timestamp
