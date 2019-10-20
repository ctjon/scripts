#!/bin/sh
#
# rsync of RHEL Reposyncs from server0
# Ansible managed
#

echo "********************************************************************************"
echo "* UPDATING RHEL Reposyncs                                                      *"
echo "********************************************************************************"
export SRCDIR=rsync://install.internal.tjon.net/rhel-reposyncs/
export TGTDIR=/export/install/Linux/rhel-reposyncs/

time rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 	$SRCDIR $TGTDIR

