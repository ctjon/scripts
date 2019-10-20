#!/bin/sh
ARCHIVE_DIR=/net/linux/archive
export ARCHIVE_DIR
#
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-x86_64/atrpms/stable/ -o $ARCHIVE_DIR/logs/pbone.net-rhfc4.at.x86_64.log -P $ARCHIVE_DIR/Fedora/pbone.net
