#!/bin/bash

VERSION=`cat /etc/redhat-release |awk '{print $7}'|awk -F '.' '{print $1}'`
MNTDIR=/mnt/install
ARCH=`uname -i`
TARGETDIR=/mnt/install/Linux/rhel-reposyncs/$VERSION/$ARCH
TMPFILE=/tmp/repolist

mount $MNTDIR
if [ $? != 0 ]
then
	echo "reposync.sh failed to mount $MNTDIR - exiting"
	exit -1
fi

echo "********************************************************************************"
echo "* Starting RepoSync for $VERSION"
echo "* MNTDIR=$MNTDIR"
echo "* TARGETDIR=$TARGETDIR"
echo "* TMPFILE=$TMPFILE"
echo "********************************************************************************"

#subscription-manager repos --list|grep "Repo ID:"|grep -iv beta|grep -iv htb|awk '{print $3}' >$TMPFILE
subscription-manager repos --list|grep "Repo ID:"|awk '{print $3}' >$TMPFILE

for i in `cat /tmp/repolist`
do
	echo "********************************************************************************"
	echo "* reposyncing $i at `/bin/date`"
	echo "********************************************************************************"
	case $VERSION in
		5)
			mkdir -p $TARGETDIR/$i 
			reposync -d -n -l --repoid=$i --downloadcomps --download_path=$TARGETDIR
			createrepo -v $TARGETDIR/$i 
		;;
		6)
			mkdir -p $TARGETDIR/$i 
			reposync -d -n -l --repoid=$i \
			--downloadcomps --download-metadata \
			--download_path=$TARGETDIR
			createrepo -v $TARGETDIR/$i -g comps.xml
		;;
		7)
			mkdir -p $TARGETDIR/$i 
			reposync -d -n --gpgcheck -l --repoid=$i \
			--downloadcomps --download-metadata \
			--download_path=$TARGETDIR
			createrepo -v $TARGETDIR/$i -g comps.xml
		;;
		*)
			echo "Unknown Version - exiting"
		;;
	esac
done

	echo "********************************************************************************"
echo "* reposync for $VERSION completed at `/bin/date`"
	echo "********************************************************************************"

umount $MNTDIR

#/bin/rm $TMPFILE
