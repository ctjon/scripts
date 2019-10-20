#!/bin/sh
SCRIPTDIR=/volume2/homes/chris/scripts
export SCRIPTDIR  

echo "********************************************************************************"
echo "Updating CentOS"
$SCRIPTDIR/centos-sync.sh
echo "Done!"

echo "********************************************************************************"
echo "Updating EPEL"
$SCRIPTDIR/epel-sync.sh
echo "Done!"

echo "********************************************************************************"
echo "Updating OpenBSD 5.3"
$SCRIPTDIR/openbsd53-sync.sh
echo "Done!"

echo "********************************************************************************"
echo "Updating Fedora 18"
$SCRIPTDIR/fedora18-sync.sh
echo "Done!"

echo "********************************************************************************"
echo "Updating Fedora 19"
$SCRIPTDIR/fedora19-sync.sh
echo "Done!"

