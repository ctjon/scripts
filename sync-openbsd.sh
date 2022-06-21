#!/bin/sh
#
# Sync OpenBSD Repo Locally
# Ansible managed
#

export SRCDIR=rsync://mirrors.ocf.berkeley.edu/openbsd
export TGTDIR=/export/install/OpenBSD

echo "********************************************************************************"
echo "* UPDATING OpenBSD BINARIES                                                    *"
echo "********************************************************************************"
# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
        sleep 10
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
        --include=amd64 \
        --include=arm64 \
        --include=armv7 \
        --include=aarch64 \
        --include=macppc \
        --include=powerpc64 \
        --include=sparc64 \
        --include=sh \
        --exclude=i386 \
        --exclude=arm \
        --exclude=armish \
        --exclude=armv7 \
        --exclude=arm64 \
        --exclude=alpha \
        --exclude=aviion \
        --exclude=beagle \
        --exclude=hp300 \
        --exclude=hppa \
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
        --exclude=powerpc \
        --exclude=riscv64 \
        --exclude=sgi \
        --exclude=socppc \
        --exclude=sparc \
        --exclude=vax \
        --exclude=zaurus \
	--exclude='2.*' \
	--exclude='3.*' \
	--exclude='4.*' \
	--exclude='5.*' \
	--exclude='6.*' \
	--exclude='7.[0-0]*' \
	--exclude='snapshots' \
	--exclude='debug-*' \
	--exclude='patches/2.*' \
	--exclude='patches/3.*' \
	--exclude='patches/4.*' \
	--exclude='patches/5.*' \
	--exclude='patches/7.[0-0]*' \
 	$SRCDIR $TGTDIR
done

date
