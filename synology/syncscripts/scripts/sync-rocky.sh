#!/bin/sh
#
# rsync of Rocky Linux Distribution
# Ansible managed
#

export SRCDIR=rsync://mirror.chpc.utah.edu/pub/rocky/
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
	--exclude='sssd-krb5-common-2.9.4-3.el8_10.x86_64.rpm' \
 	$SRCDIR $TGTDIR
done

#	--exclude='i686' \
