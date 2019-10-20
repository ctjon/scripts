#!/bin/bash
for i in `sudo virsh list --all|tail -n +3|awk '{print $2}'`
do
        sudo virsh snapshot-list $i
done

