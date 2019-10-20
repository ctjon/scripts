#!/bin/sh
#
export SRCDIR=rsync://install.internal.tjon.net/virtio-win
export TGTDIR=/export/install/Linux/virtio-win

mkdir -p $TGTDIR

	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during \
	--delete-excluded --progress \
 	$SRCDIR $TGTDIR

