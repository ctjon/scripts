#!/bin/sh
#
export RELEASE=22
export SRCDIR=rsync://mirrors.kernel.org/fedora/releases/$RELEASE/
#export TGTDIR=/export/install/Linux/fedora/$RELEASE/
export TGTDIR=/Volumes/SBPF4TB/Install/Linux/fedora/$RELEASE/
rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
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

export SRCDIR=rsync://mirrors.kernel.org/fedora/updates/$RELEASE/
#export TGTDIR=/export/install/Linux/fedora/$RELEASE-Updates/
export TGTDIR=/Volumes/SBPF4TB/Install/Linux/fedora/$RELEASE-Updates/
rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
--include='boot.iso' \
--include='*.iso' \
--include='x86_64/' \
--exclude='i386/' \
--exclude='arm/' \
--exclude='armhfp/' \
--exclude='alpha/' \
--exclude='ia64/' \
--exclude='s390/' \
--exclude='s390x/' \
--include='ppc/' \
--include='ppc64/' \
--include='ppc64le/' \
--exclude='aarch64/' \
--exclude='*.torrent' \
 $SRCDIR $TGTDIR
 
export SRCDIR=rsync://mirrors.kernel.org/fedora-secondary/releases/$RELEASE/
#export TGTDIR=/export/install/Linux/fedora-secondary/$RELEASE/
export TGTDIR=/Volumes/SBPF4TB/Install/Linux/fedora-secondary/$RELEASE/
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
 
export SRCDIR=rsync://mirrors.kernel.org/fedora-secondary/updates/$RELEASE/
#export TGTDIR=/export/install/Linux/fedora-secondary/$RELEASE-Updates/
export TGTDIR=/Volumes/SBPF4TB/Install/Linux/fedora-secondary/$RELEASE-Updates/
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
--include='SRPMS/' \
--exclude='*.torrent' \
 $SRCDIR $TGTDIR
