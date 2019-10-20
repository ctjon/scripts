#!/bin/bash
for i in `sudo virsh list --all|tail -n +3|awk '{print $2}'`
do
	echo "################################################################################"
	echo "Performing Snapshot of $i"
        sudo virsh snapshot-list $i
        sudo virsh snapshot-create-as $i $i-snap
        sudo virsh snapshot-list $i
done

