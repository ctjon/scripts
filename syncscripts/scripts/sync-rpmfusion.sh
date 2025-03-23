#!/bin/sh
#
# rsync of RPM Fusion
# Ansible managed
#

export SRCDIR=rsync://download1.rpmfusion.org/rpmfusion/
export TGTDIR=/Volumes/Install/Linux/rpm-fusion/
echo "********************************************************************************"
echo "* Syncing RPM Fusion                                                           *"
echo "********************************************************************************"
mkdir -p $TGTDIR

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
        --exclude='31' \
        --exclude='32' \
        --exclude='33' \
        --exclude='34' \
        --exclude='fedora-secondary' \
        --exclude='debug' \
        --exclude='i386' \
        --exclude='testing' \
        --exclude='development' \
 	$SRCDIR $TGTDIR
done

date
