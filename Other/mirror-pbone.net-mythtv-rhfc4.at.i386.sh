#!/bin/sh
ARCHIVE_DIR=/archive/linux
export ARCHIVE_DIR
#
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-i386/atrpms/stable/myth* -o $ARCHIVE_DIR/logs/pbone.net-mythtv.rhfc4.at.i386.log -P $ARCHIVE_DIR/mythtv/RPMS
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-i386/atrpms/stable/libmyth* -o $ARCHIVE_DIR/logs/pbone.net-mythtv.rhfc4.at.i386.log -P $ARCHIVE_DIR/mythtv/RPMS
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-i386/atrpms/stable/libXvMCW* -o $ARCHIVE_DIR/logs/pbone.net-mythtv.rhfc4.at.i386.log -P $ARCHIVE_DIR/mythtv/RPMS
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-i386/atrpms/stable/libdvdnav* -o $ARCHIVE_DIR/logs/pbone.net-mythtv.rhfc4.at.i386.log -P $ARCHIVE_DIR/mythtv/RPMS
wget --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc4-i386/atrpms/stable/libiec61883* -o $ARCHIVE_DIR/logs/pbone.net-mythtv.rhfc4.at.i386.log -P $ARCHIVE_DIR/mythtv/RPMS
