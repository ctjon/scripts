#!/bin/sh
#
export SRCDIR=rsync://ftp5.usa.openbsd.org/ftp
export TGTDIR=/export/install/openbsd
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
--exclude='2.?' \
--exclude='3.?' \
--exclude='4.?' \
--exclude='5.[0-8]' \
--exclude='patches/2.*' \
--exclude='patches/3.*' \
--exclude='patches/4.*' \
--exclude='patches/5.[0-5]*' \
--exclude='*.torrent' \
--exclude='alpha' \
--include='amd64' \
--exclude='armish' \
--exclude='armv7' \
--exclude='arm' \
--exclude='sh' \
--exclude='aviion' \
--exclude='beagle' \
--exclude='hp300' \
--exclude='hppa' \
--include='i386' \
--exclude='landisk' \
--exclude='loongson' \
--exclude='luna88k' \
--include='macppc' \
--exclude='mips64' \
--exclude='mips64el' \
--exclude='m68k' \
--exclude='m88k' \
--exclude='mvme68k' \
--exclude='mvme88k' \
--exclude='octeon' \
--include='powerpc' \
--exclude='sgi' \
--include='socppc' \
--exclude='sparc' \
--exclude='sparc64' \
--exclude='vax' \
--exclude='zaurus' \
--exclude='snapshots' \
--exclude='songs' \
 $SRCDIR $TGTDIR
 
#--exclude='snapshots' \
