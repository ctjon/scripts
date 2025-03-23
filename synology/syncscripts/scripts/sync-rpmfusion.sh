#!/bin/sh
#
# rsync of RPM Fusion
# Ansible managed
#

export SRCDIR=rsync://download1.rpmfusion.org/rpmfusion/
export TGTDIR=/volume1/Install/Linux/rpm-fusion/
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
        --exclude='3[1-8]' \
        --exclude='rpmfusion-free-release-1?.noarch.rpm' \
        --exclude='rpmfusion-free-release-2?.noarch.rpm' \
        --exclude='rpmfusion-free-release-3[0-8].noarch.rpm' \
        --exclude='rpmfusion-nonfree-release-1?.noarch.rpm' \
        --exclude='rpmfusion-nonfree-release-2?.noarch.rpm' \
        --exclude='rpmfusion-nonfree-release-3[0-8].noarch.rpm' \
        --exclude='fedora-secondary' \
        --exclude='debug' \
        --exclude='i386' \
        --exclude='testing' \
        --exclude='development' \
 	$SRCDIR $TGTDIR
done

date
