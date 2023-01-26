#!/bin/sh
#
# rsync of CentOS Binary Distribution
# Ansible managed
#

echo "********************************************************************************"
echo "* UPDATING CENTOS BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://mirrors.kernel.org/centos/
export TGTDIR=/Volumes/Install/Linux/centos/

# set return code to be false to force first iteration of while loop ironically this give error because it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
        --include 'x86_64' \
        --include 'source' \
        --include 'SRPMS' \
        --include 'aarch64' \
        --include '*.iso' \
        --include '*.qcow2' \
        --exclude 'development' \
        --exclude 'releases/test' \
        --exclude 'debug' \
        --exclude 'beta' \
        --exclude 'debug' \
        --exclude 'arm' \
        --exclude 'armhfp' \
        --exclude 'alpha' \
        --exclude 'ia64' \
        --exclude 'i386' \
        --exclude 's390' \
        --exclude 's390x' \
        --exclude 'ppc' \
        --exclude 'ppc64' \
        --exclude 'ppc64le' \
        --exclude 'testing' \
        --exclude 'updates/testing' \
        --exclude '*.torrent' \
        --exclude '*.box' \
        --exclude '*.raw.xz' \
	--exclude='2' \
	--exclude='2.?' \
	--exclude='3' \
	--exclude='3.*' \
	--exclude='4' \
	--exclude='4.*' \
	--exclude='5' \
	--exclude='5.*' \
	--exclude='RPM-GPG-KEY-beta' \
	--exclude='RPM-GPG-KEY-CentOS-3' \
	--exclude='RPM-GPG-KEY-CentOS-4' \
	--exclude='RPM-GPG-KEY-centos4' \
	--exclude='HEADER.html' \
	--exclude='HEADER_AD.html' \
	--exclude='HEADER.images/' \
 	$SRCDIR $TGTDIR
done
date
