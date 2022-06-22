#!/bin/bash
echo arg# = [$#]
echo arg0 = [$0]
echo arg1 = [$1]
echo arg2 = [$2]
echo arg3 = [$3]

if [ $# -ne 2 ]
then
	echo "Usage: $0 <GuestVM> <ISOimage>"
	exit -1
else
	echo "attaching $2 to $1 as /dev/hdc"
	sudo virsh attach-disk $1 $2 hdc --live --type cdrom --mode readonly
fi
