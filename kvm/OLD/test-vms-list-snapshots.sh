#!/bin/bash
for i in `sudo virsh list --all|grep test|awk '{print $2}'`
do
        sudo virsh snapshot-list $i
done

