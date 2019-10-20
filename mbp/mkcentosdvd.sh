#!/bin/sh
export RELEASE=5.5
export ARCH=x86_64
export ISODIR=/mnt/hgfs/Downloads
export TMPDIR=/mnt/hgfs/Downloads/CentOS-$RELEASE-$ARCH-DVD
export MNTDIR=/mnt

echo "Setting up Temporary Directory"
/bin/rm -rf $TMPDIR
mkdir $TMPDIR

echo "Creating loopback mountpoints"
mkdir $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1
mkdir $MNTDIR/CentOS-$RELEASE-$ARCH-DVD2

echo "Mounting ISO Images"
mount -o ro,loop $ISODIR/CentOS-$RELEASE-$ARCH-bin-DVD-1of2.iso /mnt/CentOS-$RELEASE-$ARCH-DVD1
mount -o ro,loop $ISODIR/CentOS-$RELEASE-$ARCH-bin-DVD-2of2.iso /mnt/CentOS-$RELEASE-$ARCH-DVD2

echo "Copying Distribution"
#/bin/cp -rf $MNTDIR/CentOS-$RELEASE-$ARCH-DVD2/* $TMPDIR
#/bin/cp -rf $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1/* $TMPDIR
/bin/cp -rf $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1/isolinux $TMPDIR
chmod 644 $TMPDIR/isolinux/isolinux.bin
#/bin/cp -rf $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1/.discinfo $TMPDIR


echo "Creating .discinfo file"
echo "1272326751.405938
Final
x86_64
1,2
CentOS/base
/home/buildcentos/CENTOS/5.5/en/x86_64/CentOS
CentOS/pixmaps" >$TMPDIR/.discinfo
chmod 644 $TMPDIR/.discinfo

echo "Creating ISO Image"
mkisofs -o $ISODIR/CentOS-$RELEASE-$ARCH-DVD.iso \
	-b isolinux/isolinux.bin -c isolinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	-R -m TRANS.TBL \
	-T \
	-V CentOS-$RELEASE-$ARCH \
	-x $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1/.discinfo \
	-x $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1/isolinux \
	-graft-points $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1 \
	.discinfo=$TMPDIR/.discinfo isolinux/=$TMPDIR/isolinux \
	CentOS/=$MNTDIR/CentOS-$RELEASE-$ARCH-DVD2/CentOS \

echo "Implanting MD5 Checksum(from anaconda-runtime)"
/usr/lib/anaconda-runtime/implantisomd5 $ISODIR/CentOS-$RELEASE-$ARCH-DVD.iso

echo "Unmounting ISO Images"
umount $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1
umount $MNTDIR/CentOS-$RELEASE-$ARCH-DVD2

echo "Removing loopback mountpoints"
rmdir $MNTDIR/CentOS-$RELEASE-$ARCH-DVD1
rmdir $MNTDIR/CentOS-$RELEASE-$ARCH-DVD2
