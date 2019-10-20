#!/bin/sh
#
# rsync of Ubuntu Distribution
# Ansible managed
#

echo "********************************************************************************"
echo "* UPDATING Ubuntu BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://us.archive.ubuntu.com/ubuntu/
export TGTDIR=/export/install/Linux/ubuntu-reposyncs/

# set return code to be false to force first iteration of while loop ironically this give error because it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded \
	--progress \
        --include 'xenial*' \
        --exclude 'binary-i386' \
        --exclude 'devel*' \
        --exclude 'precise*' \
        --exclude 'trusty*' \
        --exclude 'artful*' \
        --exclude 'bionic*' \
        --exclude 'cosmic*' \
        --exclude 'disco*' \
 	$SRCDIR $TGTDIR
done
