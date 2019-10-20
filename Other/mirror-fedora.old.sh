#!/bin/sh
#
ARCHIVE_DIR=/archive/linux;export ARCHIVE_DIR
FEDORA_VERSION=4;export FEDORA_VERSION
#
# Sync all the subsequent Core fixes
#
echo "Syncing the Core $FEDORA_VERSION Updates"
#rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/x86_64/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/x86_64/
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/i386/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/i386/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/SRPMS/
#
# Sync the Initial Core Archive
#
echo "Syncing the Core $FEDORA_VERSION Distribution Archive"
#rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/x86_64/os/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/x86_64/os/
#rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/x86_64/iso/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/x86_64/iso/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/i386/os/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/i386/os/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/i386/iso/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/i386/iso/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/SRPMS/
#
# Sync all the Fedora Extras
#
echo "Syncing the Core $FEDORA_VERSION Distribution Extras"
#rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/extras/$FEDORA_VERSION/x86_64/ $ARCHIVE_DIR/Fedora/extras/$FEDORA_VERSION/x86_64/
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/extras/$FEDORA_VERSION/i386/ $ARCHIVE_DIR/Fedora/extras/$FEDORA_VERSION/i386/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/SRPMS/
#
# Sync rpms from freshrpms.net
#
wget -nv --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force ftp://freshrpms.net/pub/freshrpms/fedora/linux/$FEDORA_VERSION/ -P $ARCHIVE_DIR/Fedora/freshrpms/$FEDORA_VERSION
#
# Mirror pbone.net
#
#wget -nv --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc$FEDORA_VERSION-x86_64/atrpms/stable/ -P $ARCHIVE_DIR/Fedora/pbone.net/$FEDORA_VERSION
wget -nv --timeout=180 -m -nH -c --cut-dirs=5 --tries=3 --progress=bar:force  ftp://rpm.pbone.net/mirror/atrpms.net/fc$FEDORA_VERSION-i386/atrpms/stable/ -P $ARCHIVE_DIR/Fedora/pbone.net/$FEDORA_VERSION
#
# Mirror pvpgn
#
wget -nv --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://download.berlios.de/pvpgn -P $ARCHIVE_DIR/pvpgn
wget -nv --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://pvpgn-files.ath.cx/files -P $ARCHIVE_DIR/pvpgn
wget -nv --timeout=180 -m -kK -nH -c --tries=3 --progress=bar:force http://pvpgn-files.ath.cx/releases -P $ARCHIVE_DIR/pvpgn

