#!/bin/bash
for i in `sudo virsh list --all|tail -n +3|awk '{print $2}'`
do
        echo "Removing Snapshot of $i"
        sudo virsh snapshot-list $i
        sudo virsh snapshot-delete $i $i-snap
        sudo virsh snapshot-list $i
done

