#!/bin/sh
# Before running this script, be sure to perform the following tasks:
#
# 1) Build anaconda src rpm for implantisomd5 binary
#	rpm -ivh SRPMS/$ANACONDARPM.rpm
#	mkdir -p /usr/src/redhat
#	cd /usr/src/redhat
#	cp SPECS/anaconda.spec SPECS/anaconda.spec.dist
#	sed 's/BuildPreReq/\#BuildPreReq/' SPECS/anaconda.spec>SPECS/anaconda.spec.tmp
#	sed 's/BuildReq/\#BuildReq/' SPECS/anaconda.spec.tmp>SPECS/anaconda.spec
#	rm SPECS/anaconda.spec.tmp
#	rpmbuild -bp SPECS/anaconda.spec
#	cd BUILD/anaconda*/isomd5sum
#	make
#	cd /usr/src/redhat/BUILD/anaconda-10.2.1.5/isomd5sum
#	make install
# 2) Make full allocation of /dev/loop* devices
#	/dev/MAKEDEV loop
#

ARCH=$1		# i386, ppc, or x86_64
TYPE=$2		# AS, ES, WS, or Desktop
RELEASE=$3	# ie: RHEL4, rhel3 etc. (must match filename of iso images)
VERSION=$4	# ie: v3, V4 etc. (must match filename of iso images)
UPDATE=$5	# ie: U2, u6, etc. (must match filename of iso images)
SRCLABEL=$6	# ie: src or source
ISOPATH=/net/virtualcds/Linux/RH$TYPE$VERSION$UPDATE-$ARCH; export ISOPATH
TARGET_DIR=/net/virtualcds/tmp/RH$TYPE$VERSION$UPDATE-$ARCH-DVD; export TARGET_DIR
BINRELEASE=$RELEASE-$UPDATE-$ARCH-$TYPE; export BINRELEASE
SRCRELEASE=$RELEASE-$UPDATE-$ARCH-$SRCLABEL; export SRCRELEASE
DOCRELEASE=$RELEASE-docs-dvd; export DOCRELEASE
SCRIPTDIR=/net/linux/scripts;export SCRIPTDIR

if [ $# != 6 ]
then
	echo "usage: $0 <arch> <type> <release> <version> <update> <src type>"
	echo "where arch	= i386|x86_64|ppc ..."
	echo "      type	= AS|ES|WS|Desktop"
	echo "      release	= rhel-3|RHEL4|RHDesktop ..."
	echo "      version	= v3|V4 ..."
	echo "      update	= U2|u6 ..."
	echo "      update	= src|source ..."
	exit 1
fi

mkdir -p $TARGET_DIR
cd $TARGET_DIR

echo "Making Mount Points"
# Make Directories for Mounting of ISO Images
mkdir $TARGET_DIR/$BINRELEASE-disc1
mkdir $TARGET_DIR/$BINRELEASE-disc2
mkdir $TARGET_DIR/$BINRELEASE-disc3
mkdir $TARGET_DIR/$BINRELEASE-disc4
mkdir $TARGET_DIR/$SRCRELEASE-disc1
mkdir $TARGET_DIR/$SRCRELEASE-disc2
mkdir $TARGET_DIR/$SRCRELEASE-disc3
mkdir $TARGET_DIR/$DOCRELEASE

echo "Mounting ISO Images"
# Mount ISO Images
mount -o ro,loop $ISOPATH/$BINRELEASE-disc1.iso $TARGET_DIR/$BINRELEASE-disc1
mount -o ro,loop $ISOPATH/$BINRELEASE-disc2.iso $TARGET_DIR/$BINRELEASE-disc2
mount -o ro,loop $ISOPATH/$BINRELEASE-disc3.iso $TARGET_DIR/$BINRELEASE-disc3
mount -o ro,loop $ISOPATH/$BINRELEASE-disc4.iso $TARGET_DIR/$BINRELEASE-disc4
mount -o ro,loop $ISOPATH/$SRCRELEASE-disc1.iso $TARGET_DIR/$SRCRELEASE-disc1
mount -o ro,loop $ISOPATH/$SRCRELEASE-disc2.iso $TARGET_DIR/$SRCRELEASE-disc2
mount -o ro,loop $ISOPATH/$SRCRELEASE-disc3.iso $TARGET_DIR/$SRCRELEASE-disc3
mount -o ro,loop $ISOPATH/$DOCRELEASE.iso $TARGET_DIR/$DOCRELEASE

# Create new .discinfo file
echo "Creating new .discinfo file"
sed 's/1$/1,2,3,4/' $TARGET_DIR/$BINRELEASE-disc1/.discinfo > .discinfo
cat .discinfo
echo "Done!"

cp -ar $TARGET_DIR/$BINRELEASE-disc1/isolinux $TARGET_DIR

# Create new ISO image
echo "Creating new ISO Image"
rm -f $TARGET_DIR/$BINRELEASE-dvd.iso
mkisofs -o $TARGET_DIR/$BINRELEASE-dvd.iso \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	-l -r -J -m TRANS.TBL \
	-x $TARGET_DIR/$BINRELEASE-disc1/.discinfo \
	-x $TARGET_DIR/$BINRELEASE-disc1/isolinux \
	-x $TARGET_DIR/$SRCRELEASE-disc?/SRPMS/comps-[34]$TYPE-0.*.src.rpm \
	-x isolinux/boot.cat \
	-V "RedHat $BINRELEASE DVD" \
	-hide-joliet-trans-tbl \
	-hide-rr-moved \
	-allow-leading-dots \
	-graft-points $TARGET_DIR/$BINRELEASE-disc1 \
	.discinfo=.discinfo \
	isolinux/=isolinux \
	RedHat/=$TARGET_DIR/$BINRELEASE-disc2/RedHat \
	RedHat/=$TARGET_DIR/$BINRELEASE-disc3/RedHat \
	RedHat/=$TARGET_DIR/$BINRELEASE-disc4/RedHat \
	SRPMS/=$TARGET_DIR/$SRCRELEASE-disc1/SRPMS \
	SRPMS/=$TARGET_DIR/$SRCRELEASE-disc2/SRPMS \
	SRPMS/=$TARGET_DIR/$SRCRELEASE-disc3/SRPMS \
	docs/=$TARGET_DIR/$DOCRELEASE \
	misc/=$SCRIPTDIR 

# Create MD5 Checksums
echo "Creating md5 checksums"
/usr/lib/anaconda-runtime/implantisomd5 $TARGET_DIR/$BINRELEASE-dvd.iso

# Umount ISO Images
echo "Unmounting ISO Images"
umount $TARGET_DIR/$BINRELEASE-disc1
umount $TARGET_DIR/$BINRELEASE-disc2
umount $TARGET_DIR/$BINRELEASE-disc3
umount $TARGET_DIR/$BINRELEASE-disc4
umount $TARGET_DIR/$SRCRELEASE-disc1
umount $TARGET_DIR/$SRCRELEASE-disc2
umount $TARGET_DIR/$SRCRELEASE-disc3
umount $TARGET_DIR/$DOCRELEASE

# Remove Directories for Mount Points
echo "Removing Mount Points"
rmdir $TARGET_DIR/$BINRELEASE-disc1
rmdir $TARGET_DIR/$BINRELEASE-disc2
rmdir $TARGET_DIR/$BINRELEASE-disc3
rmdir $TARGET_DIR/$BINRELEASE-disc4
rmdir $TARGET_DIR/$SRCRELEASE-disc1
rmdir $TARGET_DIR/$SRCRELEASE-disc2
rmdir $TARGET_DIR/$SRCRELEASE-disc3
rmdir $TARGET_DIR/$DOCRELEASE

echo "DVD ISO Creation Complete, you may burn to DVD"
