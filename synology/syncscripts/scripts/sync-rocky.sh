#!/bin/sh
#
# rsync of Rocky Linux Distribution
# Ansible managed
#

export SRCDIR=rsync://mirrors.rit.edu/rocky/
export TGTDIR=/volume1/Install/Linux/rocky/
echo "********************************************************************************"
echo "* Syncing Rocky Linux Repos                                                    *"
echo "********************************************************************************"
mkdir -p $TGTDIR

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
	--exclude='8.[0-9]/' \
	--exclude='9.[0-3]/' \
	--exclude='s390x' \
	--exclude='ppc64le' \
	--exclude='debug' \
 	$SRCDIR $TGTDIR
done

