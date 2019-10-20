#!/bin/sh
#
# Sync OpenBSD Repo Locally
# Ansible managed
#

export SRCDIR=rsync://install.internal.tjon.net/openbsd
export TGTDIR=/export/install/OpenBSD

echo "********************************************************************************"
echo "* UPDATING OpenBSD BINARIES                                                    *"
echo "********************************************************************************"

	rsync -aHKvz --keep-dirlinks --delete-during \
	--delete-excluded --progress \
        --include=amd64 \
        --exclude=arm \
        --exclude=armish \
        --exclude=armv7 \
        --exclude=arm64 \
        --exclude=aarch64 \
        --exclude=macppc \
        --exclude=powerpc \
        --exclude=socppc \
        --exclude=sparc \
        --exclude=sparc64 \
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
        --exclude=mips64 \
        --exclude=mips64el \
        --exclude=m68k \
        --exclude=m88k \
        --exclude=mvme68k \
        --exclude=mvme88k \
        --exclude=octeon \
        --exclude=sgi \
        --exclude=vax \
        --exclude=zaurus \
        --exclude=*.torrent \
	--exclude='2.*' \
	--exclude='3.*' \
	--exclude='4.*' \
	--exclude='5.*' \
	--exclude='6.[0-4]' \
	--exclude='patches/2.*' \
	--exclude='patches/3.*' \
	--exclude='patches/4.*' \
	--exclude='patches/5.*' \
	--exclude='patches/6.[0-4]*' \
 	$SRCDIR $TGTDIR
