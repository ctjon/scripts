#!/bin/sh
#
# rsync of Fedora EPEL archive
# Ansible managed
#

export SRCDIR=rsync://mirrors.kernel.org/fedora-epel/
export TGTDIR=/volume1/Install/Linux/epel
echo "********************************************************************************"
echo "* UPDATING EPEL BINARIES                                                       *"
echo "********************************************************************************"

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
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
	--exclude='4' \
	--exclude='4AS' \
	--exclude='4ES' \
	--exclude='4WS' \
	--exclude='RPM-GPG-KEY-EPEL-4' \
	--exclude='5' \
	--exclude='5Client' \
	--exclude='5Server' \
	--exclude='RPM-GPG-KEY-EPEL-5' \
	--exclude='6' \
	--exclude='6Server' \
	--exclude='RPM-GPG-KEY-EPEL-6' \
	--exclude='RPM-GPG-KEY-EPEL-6Server' \
	--exclude='7' \
	--exclude='7Server' \
	--exclude='RPM-GPG-KEY-EPEL-7' \
	--exclude='RPM-GPG-KEY-EPEL-7Server' \
	--exclude='playground' \
 	$SRCDIR $TGTDIR
done
date
