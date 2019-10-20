#!/bin/sh
#
# rsync of Fedora Distribution
# Ansible managed
#

export SRCDIR=rsync://install.internal.tjon.net/fedora/
export TGTDIR=/export/install/Linux/fedora/
echo "********************************************************************************"
echo "* Syncing Fedora Repos                                                         *"
echo "********************************************************************************"
mkdir -p $TGTDIR

	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during \
	--delete-excluded --progress \
	--include='x86_64' \
	--include='source' \
	--include='SRPMS' \
	--include='boot.iso' \
	--include='*.qcow2' \
	--exclude='development' \
	--exclude='updates/testing' \
	--exclude='releases/test' \
	--exclude='debug' \
	--exclude='beta' \
	--exclude='testing' \
	--exclude='ppc' \
	--exclude='ppc64' \
	--exclude='ppc64le' \
	--exclude='aarch64' \
	--exclude='arm' \
	--exclude='armhfp' \
	--exclude='i386' \
	--exclude='alpha' \
	--exclude='ia64' \
	--exclude='s390' \
	--exclude='s390x' \
	--exclude='*.iso' \
	--exclude='*.torrent' \
	--exclude='*.box' \
	--exclude='*.raw.xz' \
	--exclude='core/' \
	--exclude='releases/7/' \
	--exclude='releases/8/' \
	--exclude='releases/9/' \
	--exclude='releases/1[0-9]/' \
	--exclude='releases/2[0-7]/' \
	--exclude='updates/7/' \
	--exclude='updates/8/' \
	--exclude='updates/9/' \
	--exclude='updates/1[0-9]/' \
	--exclude='updates/2[0-7]/' \
 	$SRCDIR $TGTDIR

export SRCDIR=rsync://install.internal.tjon.net/fedora-secondary/
export TGTDIR=/export/install/Linux/fedora-secondary/
echo "********************************************************************************"
echo "* Syncing Fedora Secondary Repos                                               *"
echo "********************************************************************************"
mkdir -p $TGTDIR

	rsync -aHKvz --keep-dirlinks --delete --delete-during \
	--delete-excluded --progress \
	--include=x86_64 \
	--include=source \
	--include=SRPMS \
	--include=boot.iso \
	--include=*.qcow2 \
	--exclude=development \
	--exclude=updates/testing \
	--exclude=releases/test \
	--exclude=debug \
	--exclude=beta \
	--exclude=testing \
	--exclude=ppc \
	--exclude=ppc64 \
	--exclude=ppc64le \
	--exclude=aarch64 \
	--exclude=arm \
	--exclude=armhfp \
	--exclude=i386 \
	--exclude=alpha \
	--exclude=ia64 \
	--exclude=s390 \
	--exclude=s390x \
	--exclude=*.iso \
	--exclude=*.torrent \
	--exclude=*.box \
	--exclude=*.raw.xz \
	--exclude='core/' \
	--exclude='releases/7/' \
	--exclude='releases/8/' \
	--exclude='releases/9/' \
	--exclude='releases/1[0-9]/' \
	--exclude='releases/2[0-7]/' \
	--exclude='updates/7/' \
	--exclude='updates/8/' \
	--exclude='updates/9/' \
	--exclude='updates/1[0-9]/' \
	--exclude='updates/2[0-7]/' \
 	$SRCDIR $TGTDIR
