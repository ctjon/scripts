#!/bin/bash
export USBPATH=/run/media/chris/DocumentsUSB

echo "********************************************************************************"
echo "syncing Home Directory to USB"
rsync -aHKz \
--exclude "lost+found" \
--exclude ".cache" \
--exclude ".ccache" \
--progress \
$USBPATH/ ~chris
