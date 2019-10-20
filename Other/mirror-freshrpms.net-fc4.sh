#!/bin/sh
ARCHIVE_DIR=/net/linux/archive
export ARCHIVE_DIR
#
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force ftp://freshrpms.net/pub/freshrpms/fedora/linux/4/ -o $ARCHIVE_DIR/logs/freshrpms.net-fc4.log -P $ARCHIVE_DIR/Fedora/freshrpms
