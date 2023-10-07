#!/bin/bash
for i in `sudo virsh list --all|grep test|awk '{print $2}'`
do
        echo "################################################################################"
        echo "Restoring Snapshot of $i"
        sudo virsh snapshot-list $i
        sudo virsh snapshot-revert $i $i-snap
done

