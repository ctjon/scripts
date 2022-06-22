#!/bin/bash
export SOURCE_IMAGE_PATH=/var/lib/libvirt/images
export TARGET_IMAGE_PATH=/mnt/2TB-Scratch
export TARGET_IMAGE_DEVICE=/dev/sde1

mount $TARGET_IMAGE_DEVICE $TARGET_IMAGE_path
mkdir $TARGET_IMAGE_PATH/vmdk
mkdir $TARGET_IMAGE_PATH/qcow2

echo "syncing qcow2 images to $TARGET_IMAGE_PATH/qcow2"
rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete \
--delete-before \
--delete \
--exclude=.* \
--exclude=test-*.x86_64.qcow2 \
--exclude=satclient*.x86_64.qcow2 \
--delete-excluded \
$SOURCE_IMAGE_PATH/ $TARGET_IMAGE_PATH/qcow2/

exit

echo "converting qcow2 images to $TARGET_IMAGE_PATH/vmdk"
for i in /var/lib/libvirt/images/*.qcow2
do
    base_fn=$(basename "$i" .qcow2)
    echo "Converting $base_fn"
    qemu-img convert -f qcow2 -O vmdk -o adapter_type=lsilogic,subformat=streamOptimized,compat6 $SOURCE_IMAGE_PATH/$base_fn.qcow2 $TARGET_IMAGE_PATH/$base_fn.vmdk
done

