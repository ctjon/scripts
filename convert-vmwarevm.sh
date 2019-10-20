#!/bin/bash

export LIBGUESTFS_BACKEND=direct

if [ $# -ne 1 ]
then
	echo "Usage: $0: <vmname>"
else
	echo "converting vm=$1 to kvm"

	virsh -c 'esx://root@172.16.1.63/esxi?no_verify=1' list --all

	virsh -c 'esx://root@172.16.1.63/esxi?no_verify=1' dumpxml $1

	virt-v2v -ic esx://root@172.16.1.63/esxi?no_verify=1 $1 -o local -os /var/lib/libvirt/images

	#virt-v2v -ic esx://root@172.16.1.63/esxi?no_verify=1 "$1" -o local -os /var/lib/libvirt/images

	#virt-v2v -ic esx://root@172.16.1.63/esxi?no_verify=1 "$1" -o local -os /var/lib/libvirt/images --password-file=/home/chris/scripts/esx_password.txt
fi
