lsblk
sudo pvscan
sudo lvmdevices --adddev /dev/sde1
sudo pvscan
sudo vgchange -ay /dev/backupvg
sudo lvchange -ay /dev/backupvg/backuplv
sudo mkdir /export/backup
sudo mount /dev/backupvg/backuplv /export/backup

sudo umount /export/backup
sudo lvchange -an /dev/backupvg/backuplv
sudo vgchange -an /dev/backupvg
sudo pvscan
sudo lvmdevices --deldev /dev/sde1
sudo pvscan
lsblk

