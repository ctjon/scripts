#!/bin/sh
ARCHIVE_DIR=/net/linux/archive
export ARCHIVE_DIR
#
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://ftp.orst.edu/pub/mysql/ -o $ARCHIVE_DIR/logs/mirror-mysql.log -P $ARCHIVE_DIR/mysql/
