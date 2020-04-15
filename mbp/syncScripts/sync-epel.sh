#!/bin/sh
#
# rsync of Fedora EPEL archive
#

export SRCDIR=rsync://mirrors.kernel.org/fedora-epel/
#export TGTDIR=/export/install/Linux/epel # for server0
export TGTDIR=/Volumes/Data/Install/Linux/epel # for mbp
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
        --include 'aarch64' \
        --include 'ppc' \
        --include 'ppc64' \
        --include 'ppc64le' \
        --include '*.iso' \
        --include '*.qcow2' \
        --exclude 'development' \
        --exclude 'updates/testing' \
        --exclude 'releases/test' \
        --exclude 'debug' \
        --exclude 'beta' \
        --exclude 'testing' \
        --exclude 'arm' \
        --exclude 'armhfp' \
        --exclude 'i386' \
        --exclude 'alpha' \
        --exclude 'ia64' \
        --exclude 's390' \
        --exclude 's390x' \
        --exclude '*.torrent' \
        --exclude '*.box' \
        --exclude '*.raw.xz' \
	--exclude='4' \
	--exclude='4AS' \
	--exclude='4ES' \
	--exclude='4WS' \
	--exclude='RPM-GPG-KEY-EPEL-4' \
 	$SRCDIR $TGTDIR
done
