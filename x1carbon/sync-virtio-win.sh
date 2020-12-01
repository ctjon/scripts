#!/bin/sh
#
export SRCDIR=rsync://repos.fedorapeople.org/groups/virt/
export TGTDIR=/opt/local/install/Linux/virtio-win

mkdir -p $TGTDIR

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during \
	--delete-excluded --progress \
        --exclude='virt-preview/fedora-2[0-9]' \
        --exclude='virt-preview/fedora-3[0-0]' \
        --exclude='deprecated-isos' \
 	$SRCDIR $TGTDIR
done

