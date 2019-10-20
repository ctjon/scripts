#!/bin/sh
export BACKUP_DIR=/media/Backup/apollo/`date +%w-%A`
export KS_DIR=/install/kickstart
export ARCHIVE_DIR=/archive
export DOC_DIR=/home/chris

date
echo "Clearing out 7 Day old Backups"
/bin/rm -rf $BACKUP_DIR
mkdir $BACKUP_DIR
chmod 700 /media/Backup/apollo
chown chris:chris /media/Backup/apollo
chmod 700 /media/Backup/ctjon-xp
chown chris:chris /media/Backup/ctjon-xp
chmod 700 /media/Backup/sunshine
chown kelly:kelly /media/Backup/sunshine

echo "Backing up kickstart configs"
cd $KS_DIR
tar -cpzf $BACKUP_DIR/ksConfigs.tar.gz Configs

echo "Backing up Documents"
cd $DOC_DIR
tar -cpzf $BACKUP_DIR/Documents.tar.gz Documents

cd $ARCHIVE_DIR
for i in `ls -1d [A-Z]*`
do
	echo "Backing up $i"
	chown -R chris:smbusers $i
	find $i -type f -exec chmod 664 {} \;
	find $i -type d -exec chmod 775 {} \;
	find $i -name "*.sh" -exec chmod 775 {} \;
	find $i -name "*.run" -exec chmod 775 {} \;
	tar -czpf $BACKUP_DIR/$i.tar.gz $i
done
chmod 700 /archive/Linux/scripts/ddns
chmod 600 /archive/Linux/scripts/ddns/*
chmod 700 /archive/Linux/scripts/ddns/nsupdate.sh
zip -rq $BACKUP_DIR/XPS400_Drivers.zip XPS400_Drivers
echo "Backing up .bash_profile and firefox bookmarks"
cp /home/chris/.bash_profile $BACKUP_DIR/bash_profile
cp /home/chris/.mozilla/firefox/*.default/bookmarks.html $BACKUP_DIR/bookmarks.html
cd /home/chris
echo "Backing up ID Games Files"
tar -cpzf $BACKUP_DIR/quake4Files.tar.gz .quake4
tar -cpzf $BACKUP_DIR/doom3Files.tar.gz .wolf
tar -cpzf $BACKUP_DIR/wolfFiles.tar.gz .wolf
tar -cPpzf $BACKUP_DIR/localgames.tar.gz /usr/local/games
echo "Backing up Cedega Files"
tar -cpzf $BACKUP_DIR/cedega.tar.gz .cedega*
chown -R chris:chris $BACKUP_DIR
echo "Backing up Crossover Office Files"
cd $BACKUP_DIR
#tar -cpzf $BACKUP_DIR/cxoffice.tar.gz .cxoffice
su - chris -c "/opt/cxoffice/bin/cxbottle --bottle win98 --tar $BACKUP_DIR/win98.cxarchive"
chmod 600 $BACKUP_DIR/*
chmod 700 $BACKUP_DIR
ls -l $BACKUP_DIR
df -k $BACKUP_DIR
find /media/ISOs -type f -exec chmod 644 {} \; 
find /media/ISOs -type d -exec chmod 755 {} \; 
chown -R chris:smbusers /media/ISOs
chown -R root:root /media/ISOs/lost+found
chmod 700 /media/ISOs/lost+found
date
