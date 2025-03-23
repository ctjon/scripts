#!/bin/sh
#
export SRCDIR=rsync://repos.fedorapeople.org/groups/virt/
export TGTDIR=/volume1/Install/Linux/virtio-win

mkdir -p $TGTDIR

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
        --exclude=.htaccess \
	--exclude=virt-preview \
	--exclude=deprecated-isos \
 	$SRCDIR $TGTDIR
done

date
