parted -a optimal /dev/sdd
	mklabel gpt
	mkpart Boot 0 101MB
	mkpart Data 102 -1
	toggle 1 boot
	print
	quit

mkfs.vfat -n Boot /dev/sdd1
mkfs.ext2 -m 0 -b 4096 -L Data /dev/sdd2
mkdir /mnt/Boot /mnt/Data
mount /dev/sdd1 /mnt/Boot
mount /dev/sdd2 /mnt/Data
mkdir /mnt/Data/centos
cp -v /export/ISOs/Linux/x86_64/CentOS-6.0-x86_64/CentOS-6.0-x86_64-bin-DVD?.iso /mnt/Data/centos

yum install syslinux # if not already installed on your server
syslinux -s /dev/sdd1
dd if=/usr/share/syslinux/gptmbr.bin of=/dev/sdd
mkdir /tmp/cdimage
mount -ro loop /export/ISOs/Linux/x86_64/CentOS-6.0-x86_64/CentOS-6.0-x86_64-bin-DVD1.iso /tmp/cdimage
cp -rv /mnt/cdimage/isolinux /media/Boot/syslinux
mv /mnt/Boot/syslinux/isolinux.cfg /mnt/Boot/syslinux/syslinux.cfg
umount /tmp/cdimage
rmdir /tmp/cdimage
rm -f /mnt/Boot/syslinux/isolinux.bin
vi /mnt/Boot/syslinux/syslinux.cfg
	# add method=hd:sda2:/centos to each append section
	# for kickstart, add ks=hd:sda2:/ks.cfg method=hd:sda2:/centos 			#	to each append section
