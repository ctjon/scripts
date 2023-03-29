#!/bin/bash
rsync -aHKv --keep-dirlinks --progress --delete --exclude=".*" --delete-excluded /Volumes/Backup/VirtualMachineImages/vmware-vms/ /Volumes/8TB-RAID0/VirtualMachines
