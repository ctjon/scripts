#!/bin/sh
#

#
# rsync of Kali Binary Distribution
#

echo "********************************************************************************"
echo "* UPDATING KALI BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://archive.linux.duke.edu/kali/dists/kali-current/
export TGTDIR=/export/install/Linux/kali/kali-current/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

echo "********************************************************************************"
echo "* UPDATING KALI-SECURITY BINARIES                                            *"
echo "********************************************************************************"
export SRCDIR=rsync://archive.linux.duke.edu/kali-security/
export TGTDIR=/export/install/Linux/kali/kali-security/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

echo "********************************************************************************"
echo "* UPDATING KALI CDIMAGES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://archive.linux.duke.edu/kali-images/
export TGTDIR=/export/install/Linux/kali/kali-images/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

