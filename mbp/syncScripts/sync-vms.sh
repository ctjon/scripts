#echo "syncing to /Volumes/SBF5TB-VM/VirtualMachines"
#rsync -aHKv --no-o --no-g --keep-dirlinks --progress \
#/Users/chris/VirtualMachines/ \
#--exclude=.* \
#--delete-excluded \
#/Volumes/SBF5TB-VM/VirtualMachines
#touch /Volumes/SBF5TB-VM/VirtualMachines/timestamp

echo "syncing to chris@server0:/export/vmbackup/VirtualMachines"
touch /Users/chris/VirtualMachines/timestamp
rsync -aHKv -e ssh --no-o --no-g --keep-dirlinks --progress \
/Users/chris/VirtualMachines/ \
--exclude=.* \
--delete-excluded \
chris@server0.internal.tjon.net:/export/vmbackup/VirtualMachines
