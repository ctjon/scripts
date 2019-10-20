#!/bin/bash

SRCDIR=/export/install
USBDIR=/run/media/chris/LinBkup/export-install
TFTPBOOTDIR=/var/lib/tftpboot
TFTPBOOTDESTDIR=/run/media/chris/LinBkup/tftpboot

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete-during --delete \
--exclude=".*" \
--exclude="lost+found" \
$SRCDIR/ $USBDIR

rsync -e ssh -aHKv --no-o --no-g --keep-dirlinks --progress --delete-during --delete \
--exclude=".*" \
--exclude="lost+found" \
$TFTPBOOTDIR/ $TFTPBOOTDESTDIR


