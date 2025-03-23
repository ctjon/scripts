!/bin/sh
#
# Sync OpenBSD Repo Locally
# Ansible managed
#

export SRCDIR=rsync://mirrors.ocf.berkeley.edu/openbsd/
export TGTDIR=/volume1/Install/OpenBSD

echo "********************************************************************************"
echo "* UPDATING OpenBSD BINARIES                                                    *"
echo "********************************************************************************"
# set return code to be false to force first iteration of while loop ironically this give error cause it is an error:-)
$? = 1

while [ "$?" -ne "0" ]
do
        sleep 10
	rsync -aHKvz --keep-dirlinks --delete --delete-during --delete-excluded --progress \
        --exclude=*/.~tmp~ \
        --exclude=/.~tmp~ \
        --include=amd64 \
        --include=arm64 \
        --include=macppc \
        --exclude=powerpc \
        --exclude=powerpc64 \
        --exclude=sparc64 \
        --exclude=i386 \
        --exclude=arm \
        --exclude=armish \
        --exclude=armv7 \
        --exclude=alpha \
        --exclude=aviion \
        --exclude=beagle \
        --exclude=hp300 \
        --exclude=hppa \
        --exclude=landisk \
        --exclude=loongson \
        --exclude=luna88k \
        --exclude=mips64 \
        --exclude=mips64el \
        --exclude=m68k \
        --exclude=m88k \
        --exclude=mvme68k \
        --exclude=mvme88k \
        --exclude=octeon \
        --exclude=riscv64 \
        --exclude=sgi \
        --exclude=socppc \
        --exclude=sparc \
        --exclude=vax \
        --exclude=zaurus \
	--exclude='2.*' \
	--exclude='3.*' \
	--exclude='4.*' \
	--exclude='5.*' \
	--exclude='6.*' \
	--exclude='7.[0-4]*' \
	--exclude='snapshots' \
	--exclude='debug-*' \
	--exclude='patches/2.*' \
	--exclude='patches/3.*' \
	--exclude='patches/4.*' \
	--exclude='patches/5.*' \
	--exclude='patches/7.[0-4]*' \
 	$SRCDIR $TGTDIR
done

date
