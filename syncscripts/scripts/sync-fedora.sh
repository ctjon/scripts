#!/bin/sh
#
# rsync of Fedora Distribution
# Ansible managed
#

export SRCDIR=rsync://mirrors.kernel.org/fedora/
export TGTDIR=/export/install/Linux/fedora/
echo "********************************************************************************"
echo "* Syncing Fedora Repos                                                         *"
echo "********************************************************************************"
mkdir -p $TGTDIR

# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
	sleep 10
	date
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
	--include='x86_64' \
	--include='source' \
	--include='SRPMS' \
	--include='aarch64' \
	--include='*.iso' \
	--include='*.qcow2' \
	--exclude='development' \
	--exclude='releases/test' \
	--exclude='debug' \
	--exclude='beta' \
	--exclude='debug' \
	--exclude='arm' \
	--exclude='armhfp' \
	--exclude='alpha' \
	--exclude='ia64' \
	--exclude='i386' \
	--exclude='s390' \
	--exclude='s390x' \
	--exclude='ppc' \
	--exclude='ppc64' \
	--exclude='ppc64le' \
	--exclude='testing' \
	--exclude='updates/testing' \
	--exclude='*.torrent' \
	--exclude='*.box' \
	--exclude='*.raw.xz' \
	--exclude='core/' \
	--exclude='releases/7/' \
	--exclude='releases/8/' \
	--exclude='releases/9/' \
	--exclude='releases/1[0-9]/' \
	--exclude='releases/2[0-9]/' \
	--exclude='releases/3[0-5]*/' \
	--exclude='updates/7/' \
	--exclude='updates/8/' \
	--exclude='updates/9/' \
	--exclude='updates/1[0-9]/' \
	--exclude='updates/2[0-9]/' \
	--exclude='updates/3[0-5]*/' \
	--exclude='releases/testing/3[0-5]*/' \
	--exclude='updates/testing/3[0-5]*/' \
 	$SRCDIR $TGTDIR
done

#export SRCDIR=rsync://mirrors.kernel.org/fedora-secondary/
#export TGTDIR=/export/install/Linux/fedora-secondary/
#echo "********************************************************************************"
#echo "* Syncing Fedora Secondary Repos                                               *"
#echo "********************************************************************************"
#mkdir -p $TGTDIR
#
### set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
#$? = 1
#
#while [ "$?" -ne "0" ]
#do
#	sleep 10
##	rsync -aHKvz --keep-dirlinks --delete --delete-during \
#	--delete-excluded --progress \
##	--include=x86_64 \
##	--include=source \
##	--include=SRPMS \
##	--include=aarch64 \
##	--include=*.iso \
##	--include=*.qcow2 \
###	--exclude=development \
##	--exclude=releases/test \
##	--exclude=debug \
##	--exclude=beta \
##	--exclude=debug \
##	--exclude=arm \
##	--exclude=armhfp \
##	--exclude=alpha \
##	--exclude=ia64 \
##	--exclude=i386 \
##	--exclude=s390 \
##	--exclude=s390x \
##	--exclude=ppc \
##	--exclude=ppc64 \
##	--exclude=ppc64le \
##	--exclude=testing \
##	--exclude=updates/testing \
##	--exclude=*.torrent \
##	--exclude=*.box \
##	--exclude=*.raw.xz \
##	--exclude='core/' \
#	--exclude='releases/7/' \
#	--exclude='releases/8/' \
#	--exclude='releases/9/' \
#	--exclude='releases/1[0-9]/' \
#	--exclude='releases/2[0-9]/' \
#	--exclude='releases/3[0-5]*/' \
#	--exclude='updates/7/' \
#	--exclude='updates/8/' \
#	--exclude='updates/9/' \
#	--exclude='updates/1[0-9]/' \
#	--exclude='updates/2[0-9]/' \
#	--exclude='updates/3[0-5]*/' \
# 	$SRCDIR $TGTDIR
##done
#
