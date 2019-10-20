#!/bin/sh
#
# rsync of Fedora EPEL archive
# Ansible managed
#

export SRCDIR=rsync://install.internal.tjon.net/fedora-epel/
export TGTDIR=/export/install/Linux/epel
echo "********************************************************************************"
echo "* UPDATING EPEL BINARIES                                                       *"
echo "********************************************************************************"

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
 	$SRCDIR $TGTDIR
