#!/bin/sh
#
# rsync of CentOS Binary Distribution
# Ansible managed
#

echo "********************************************************************************"
echo "* UPDATING CENTOS BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://install.internal.tjon.net/centos/
export TGTDIR=/export/install/Linux/centos/

	date
	rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded \
	--progress \
        --include 'x86_64' \
        --include 'source' \
        --include 'SRPMS' \
        --include 'boot.iso' \
        --include '*.qcow2' \
        --exclude 'development' \
        --exclude 'updates/testing' \
        --exclude 'releases/test' \
        --exclude 'debug' \
        --exclude 'beta' \
        --exclude 'testing' \
        --exclude 'ppc' \
        --exclude 'ppc64' \
        --exclude 'ppc64le' \
        --exclude 'aarch64' \
        --exclude 'arm' \
        --exclude 'armhfp' \
        --exclude 'i386' \
        --exclude 'alpha' \
        --exclude 'ia64' \
        --exclude 's390' \
        --exclude 's390x' \
        --exclude '*.iso' \
        --exclude '*.torrent' \
        --exclude '*.box' \
        --exclude '*.raw.xz' \
	--exclude='2' \
	--exclude='2.?' \
	--exclude='3' \
	--exclude='3.*' \
	--exclude='4' \
	--exclude='4.*' \
	--exclude='5' \
	--exclude='5.*' \
	--exclude='RPM-GPG-KEY-beta' \
	--exclude='RPM-GPG-KEY-CentOS-3' \
	--exclude='RPM-GPG-KEY-CentOS-4' \
	--exclude='RPM-GPG-KEY-centos4' \
	--exclude='HEADER.html' \
	--exclude='HEADER_AD.html' \
	--exclude='HEADER.images/' \
 	$SRCDIR $TGTDIR
