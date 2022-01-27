#!/bin/sh
#
# rsync of Fedora EPEL archive
# Ansible managed
#

export SRCDIR=rsync://mirrors.kernel.org/fedora-epel/
export TGTDIR=/export/install/Linux/epel
echo "********************************************************************************"
echo "* UPDATING EPEL BINARIES                                                       *"
echo "********************************************************************************"

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
        sleep 10
	date
	rsync -aHvz --keep-dirlinks --delete-during --delete-excluded \
	--progress \
        --include 'x86_64' \
        --include 'source' \
        --include 'SRPMS' \
        --exclude 'development' \
        --exclude 'updates/testing' \
        --exclude 'releases/test' \
        --exclude 'debug' \
        --exclude 'beta' \
        --exclude 'testing' \
        --exclude 'aarch64' \
        --exclude 'ppc' \
        --exclude 'ppc64' \
        --exclude 'ppc64le' \
        --exclude 'arm' \
        --exclude 'armhfp' \
        --exclude 'alpha' \
        --exclude 'ia64' \
        --exclude 'i386' \
        --exclude 's390' \
        --exclude 's390x' \
        --exclude '*.iso' \
        --exclude '*.qcow2' \
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
	--exclude='playground' \
 	$SRCDIR $TGTDIR
done
