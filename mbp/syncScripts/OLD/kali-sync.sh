#!/bin/sh
#

#
# rsync of Kali Binary Distribution
#

echo "********************************************************************************"
echo "* UPDATING KALI BINARIES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://http.kali.org/kali
export TGTDIR=/export/install/Linux/kali/kali/
#export TGTDIR=/Volumes/SBPF4TB/Install/Linux/kali/kali/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

echo "********************************************************************************"
echo "* UPDATING KALI-SECURITY BINARIES                                            *"
echo "********************************************************************************"
export SRCDIR=rsync://http.kali.org/kali-security
export TGTDIR=/export/install/Linux/kali/kali-security/
#export TGTDIR=/Volumes/SBPF4TB/Install/Linux/kali/kali-security/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

echo "********************************************************************************"
echo "* UPDATING KALI CDIMAGES                                                     *"
echo "********************************************************************************"
export SRCDIR=rsync://http.kali.org/kali-images
export TGTDIR=/export/install/Linux/kali/kali-images/
#export TGTDIR=/Volumes/SBPF4TB/Install/Linux/kali/kali-images/
rsync -aHKvz --keep-dirlinks --delete-during --delete-excluded --progress \
 $SRCDIR $TGTDIR

