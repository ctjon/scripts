#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/8TB-RAID0/VirtualMachines/ /Volumes/Backup/VirtualMachineImages/vmware-vms
