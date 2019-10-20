#!/bin/sh
#
#export SRCDIR=rsync://mirrors.kernel.org/fedora-epel
#export TGTDIR=/export/install/Linux/epel
export SRCDIR=rsync://mirrors.kernel.org/fedora-epel/
export TGTDIR=/Volumes/SBPF4TB/Install/Linux/epel
rsync -aHvz --keep-dirlinks --delete-during --delete-excluded --progress \
--exclude='beta/*' \
--exclude='testing/*' \
--exclude='*/alpha/*' \
--exclude='*/ia64/*' \
--exclude='*/s390/*' \
--exclude='*/s390x/*' \
--exclude='*/ppc/*' \
--exclude='*/ppc64/*' \
--exclude='*/i386/*' \
--exclude='*/debug/*' \
--exclude='5/*' \
--exclude='5Server/*' \
--exclude='5Client/*' \
--exclude='4/*' \
--exclude='4AS/*' \
--exclude='4ES/*' \
--exclude='4WS/*' \
--exclude='*.torrent' \
 $SRCDIR $TGTDIR
