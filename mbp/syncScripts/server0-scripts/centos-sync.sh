#!/bin/sh
#

#
# rsync of CentOS Binary Distribution
#

echo "********************************************************************************"
echo "* UPDATING CENTOS BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://mirrors.kernel.org/centos/
export TGTDIR=/export/install/Linux/centos/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
--include='boot.iso' \
--exclude='*.iso' \
--exclude='2' \
--exclude='2.?' \
--exclude='3' \
--exclude='3.?' \
--exclude='4' \
--exclude='4.?' \
--exclude='5' \
--exclude='5.*' \
--exclude='6.[0-7]' \
--exclude='7.[0-1]' \
--exclude='RPM-GPG-KEY-beta' \
--exclude='RPM-GPG-KEY-CentOS-3' \
--exclude='RPM-GPG-KEY-CentOS-4' \
--exclude='RPM-GPG-KEY-centos4' \
--include='*/i386/*' \
--exclude='*/alpha/*' \
--exclude='*/ia64/*' \
--exclude='*/s390/*' \
--exclude='*/s390x/*' \
--exclude='*/ppc/*' \
--exclude='*/ppc64/*' \
--exclude='*.torrent' \
--exclude='HEADER.html' \
--exclude='HEADER_AD.html' \
--exclude='HEADER.images/' \
 $SRCDIR $TGTDIR



##
## rsync of CentOS 6.5 Source Code
##
#echo "********************************************************************************"
#echo "* UPDATING CENTOS SOURCE CODE                                                  *"
#echo "********************************************************************************"
##export SRCDIR=vault.centos.org::centos-full-store
#export SRCDIR=rsync://vault.centos.org/centos-full-store
##export SRCDIR=rsync://archive.kernel.org/centos-vault/
#export SRCDIR=archive.centos.org::centos-full-store/
##export TGTDIR=/export/install/Linux/centos-source2/
#export TGTDIR=/Volumes/SBPF4TB-Data/Install/Linux/centos-source
#rsync -rlptDHKvz --no-o --no-g --keep-dirlinks --delete-during --delete-excluded --progress \
#--exclude='2.[0-9]' \
#--exclude='3.[0-9]' \
#--exclude='4.[0-9]*' \
#--exclude='5.[0-9]*' \
#--exclude='6.[0-4]' \
#--exclude='*.torrent' \
#--exclude='HEADER.html' \
#--exclude='HEADER_AD.html' \
#--exclude='HEADER.images/' \
#$SRCDIR $TGTDIR
 
##
## rsync of CentOS 6 DebugInfo
##
#echo "********************************************************************************"
#echo "* UPDATING CENTOS DEBUGINFO                                                    *"
#echo "********************************************************************************"
##export SRCDIR=rsync://mirror11.mirrors.tds.net::debuginfo/
##export SRCDIR=mirror11.mirrors.tds.net::debuginfo/
##export SRCDIR=mirror.nsc.liu.se::centos-debuginfo/
##export SRCDIR=chris@DiskStation:/volume2/Install/Linux/centos-debuginfo/6
##export SRCDIR=rsync://debuginfo.centos.org/centos-debuginfo/
#export SRCDIR=debuginfo.centos.org::centos-debuginfo
#export TGTDIR=/Volumes/SBPF4TB-Data/Install/Linux/centos-debuginfo/
#rsync -aHKvz --no-o --no-g --keep-dirlinks --delete-during --delete-excluded --progress \
#--exclude='4' \
#--exclude='5' \
#--exclude='6' \
#--exclude='i386' \
#--exclude='HEADER.html' \
#--exclude='HEADER_AD.html' \
#--exclude='HEADER.images/' \
#$SRCDIR $TGTDIR
