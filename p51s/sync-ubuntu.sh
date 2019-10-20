#!/bin/sh
#
# rsync of Ubuntu Distribution
# Ansible managed
#

echo "********************************************************************************"
echo "* UPDATING Ubuntu BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://install.internal.tjon.net/ubuntu/
export TGTDIR=/export/install/Linux/ubuntu-reposyncs/

	date
	rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded \
	--progress \
        --include 'xenial*' \
        --exclude 'binary-i386' \
        --exclude 'devel*' \
        --exclude 'precise*' \
        --exclude 'trusty*' \
        --exclude 'artful*' \
        --exclude 'cosmic*' \
        --exclude 'bionic*' \
        --exclude 'disco*' \
 	$SRCDIR $TGTDIR
