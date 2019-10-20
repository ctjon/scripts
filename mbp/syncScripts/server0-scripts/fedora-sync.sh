#!/bin/sh
#
#export SRCDIR=rsync://mirrors.kernel.org/fedora/
export SRCDIR=chris@server0:/export/install/Linux/fedora/releases/25
#export TGTDIR=/export/install/Linux/fedora
export TGTDIR=/Volumes/SBF4TB/Linux/fedora/releases/25
mkdir -p $TGTDIR
#rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete-during --delete-excluded \
--include='boot.iso' \
--include='*.iso' \
--exclude='alpha/' \
--include='x86_64/' \
--exclude='i386/' \
--exclude='arm/' \
--exclude='armhfp/' \
--exclude='ia64/' \
--exclude='s390/' \
--exclude='s390x/' \
--include='ppc/' \
--include='ppc64/' \
--include='ppc64le/' \
--exclude='aarch64/' \
--exclude='*.torrent' \
 $SRCDIR $TGTDIR

#--include='Fedora-$RELEASE-i386-DVD.iso' \
#--include='Fedora-$RELEASE-i386-netinstall.iso' \
#--include='Fedora-$RELEASE-x86_64-DVD.iso' \
#--include='Fedora-$RELEASE-x86_64-netinstall.iso' \
#--exclude='*/i386/*' \

#export SRCDIR=rsync://mirrors.kernel.org/fedora/updates/
#export TGTDIR=/export/install/Linux/fedora/updates
#rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
#--include='boot.iso' \
#--include='*.iso' \
#--include='x86_64/' \
#--exclude='i386/' \
#--exclude='arm/' \
#--exclude='armhfp/' \
#--exclude='alpha/' \
#--exclude='ia64/' \
#--exclude='s390/' \
#--exclude='s390x/' \
#--include='ppc/' \
#--include='ppc64/' \
#--include='ppc64le/' \
#--exclude='aarch64/' \
#--exclude='*.torrent' \
 #$SRCDIR $TGTDIR
 
exit 

export SRCDIR=rsync://mirrors.kernel.org/fedora-secondary/
#export TGTDIR=/export/install/Linux/fedora-secondary/
export TGTDIR=/Volumes/SBF4TB/Linux/fedora-secondary/
mkdir -p $TGTDIR
rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
--include='boot.iso' \
--include='*.iso' \
--include='x86_64/' \
--exclude='i386/' \
--exclude='arm/' \
--exclude='armhfp/' \
--exclude='s390/' \
--exclude='s390x/' \
--include='ppc/' \
--include='ppc64/' \
--include='ppc64le/' \
--exclude='aarch64/' \
--include='source/' \
--exclude='*.torrent' \
 $SRCDIR $TGTDIR
 
#export SRCDIR=rsync://mirrors.kernel.org/fedora-secondary/updates/$RELEASE/
#export TGTDIR=/export/install/Linux/fedora-secondary/$RELEASE-Updates/
#export TGTDIR=/Volumes/SBPF4TB/Install/Linux/fedora-secondary/$RELEASE-Updates/
#rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
#--include='boot.iso' \
#--include='*.iso' \
#--include='x86_64/' \
#--exclude='i386/' \
#--exclude='arm/' \
#--exclude='armhfp/' \
#--exclude='s390/' \
#--exclude='s390x/' \
#--include='ppc/' \
#--include='ppc64/' \
#--include='ppc64le/' \
#--exclude='aarch64/' \
#--include='SRPMS/' \
#--exclude='*.torrent' \
 #$SRCDIR $TGTDIR
