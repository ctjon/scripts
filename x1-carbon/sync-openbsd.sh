#!/bin/sh
#
# Sync OpenBSD Repo Locally
# Ansible managed
#

export SRCDIR=rsync://ftp5.usa.openbsd.org/ftp
#export TGTDIR=/export/install/OpenBSD
export TGTDIR=/run/media/chris/Backup/install/OpenBSD

echo "********************************************************************************"
echo "* UPDATING OpenBSD BINARIES                                                    *"
echo "********************************************************************************"

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
        sleep 10
	rsync -aHKvz --keep-dirlinks --delete-during \
	--delete-excluded --progress \
        --include=amd64 \
        --exclude=arm \
        --exclude=armish \
        --exclude=armv7 \
        --exclude=arm64 \
        --exclude=aarch64 \
        --exclude=alpha \
        --exclude=snapshots \
        --exclude=songs \
        --exclude=sh \
        --exclude=aviion \
        --exclude=beagle \
        --exclude=hp300 \
        --exclude=hppa \
        --exclude=i386 \
        --exclude=landisk \
        --exclude=loongson \
        --exclude=luna88k \
        --exclude=macppc \
        --exclude=mips64 \
        --exclude=mips64el \
        --exclude=m68k \
        --exclude=m88k \
        --exclude=mvme68k \
        --exclude=mvme88k \
        --exclude=octeon \
        --exclude=powerpc \
        --exclude=sgi \
        --exclude=socppc \
        --exclude=sparc \
        --exclude=sparc64 \
        --exclude=vax \
        --exclude=zaurus \
        --exclude=*.torrent \
	--exclude='2.*' \
	--exclude='3.*' \
	--exclude='4.*' \
	--exclude='5.*' \
	--exclude='6.[0-6]' \
	--exclude='patches/2.*' \
	--exclude='patches/3.*' \
	--exclude='patches/4.*' \
	--exclude='patches/5.*' \
	--exclude='patches/6.[0-6]*' \
 	$SRCDIR $TGTDIR
done
