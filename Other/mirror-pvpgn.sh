#!/bin/sh
ARCHIVE_DIR=/net/linux/archive
export ARCHIVE_DIR
#
wget --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://download.berlios.de/pvpgn -o $ARCHIVE_DIR/logs/pvpgn-files.ath.cx-pvpgn.log -P $ARCHIVE_DIR/pvpgn
wget --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://pvpgn-files.ath.cx/files -a $ARCHIVE_DIR/logs/pvpgn-files.ath.cx-pvpgn.log -P $ARCHIVE_DIR/pvpgn
wget --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://pvpgn-files.ath.cx/releases -a $ARCHIVE_DIR/logs/pvpgn-files.ath.cx-pvpgn.log -P $ARCHIVE_DIR/pvpgn
