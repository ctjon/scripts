#!/bin/sh
#
# rsync of EPEL Archive for RHEL 5
# Ansible managed
#

export SRCDIR=rsync://mirrors.rit.edu/fedora-buffet/archive/epel/
export TGTDIR=/export/install/Linux/epel-archive
echo "********************************************************************************"
echo "* UPDATING EPEL ARCHIVE BINARIES                                               *"
echo "********************************************************************************"

	date
	rsync -aHvz --keep-dirlinks --delete-during --delete-excluded \
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
	--exclude='4' \
	--exclude='4AS' \
	--exclude='4ES' \
	--exclude='4WS' \
	--exclude='RPM-GPG-KEY-EPEL-4' \
	--exclude='RPM-GPG-KEY-EPEL' \
 	$SRCDIR $TGTDIR
