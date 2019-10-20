#!/bin/sh
#
ARCHIVE_DIR=/archive/linux;export ARCHIVE_DIR
FEDORA_VERSION=4;export FEDORA_VERSION
#
# Sync all the subsequent Core fixes
#
echo "Syncing the Core $FEDORA_VERSION Updates"
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/x86_64/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/x86_64/
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/i386/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/i386/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/SRPMS/
#
# Sync the Initial Core Archive
#
echo "Syncing the Core $FEDORA_VERSION Distribution Archive"
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/x86_64/os/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/x86_64/os/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/x86_64/iso/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/x86_64/iso/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/i386/os/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/i386/os/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/i386/iso/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/i386/iso/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/$FEDORA_VERSION/SRPMS/
#
# Sync all the Fedora Extras
#
echo "Syncing the Core $FEDORA_VERSION Distribution Extras"
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/extras/$FEDORA_VERSION/x86_64/ $ARCHIVE_DIR/Fedora/extras/$FEDORA_VERSION/x86_64/
rsync -alHvz --delete --exclude="/debug/" rsync://mirrors.kernel.org/mirrors/fedora/extras/$FEDORA_VERSION/i386/ $ARCHIVE_DIR/Fedora/extras/$FEDORA_VERSION/i386/
rsync -alHvz --delete rsync://mirrors.kernel.org/mirrors/fedora/core/updates/$FEDORA_VERSION/SRPMS/ $ARCHIVE_DIR/Fedora/core/updates/$FEDORA_VERSION/SRPMS/
#
# Sync livna.org Repository
#
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/i386/RPMS.extras/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/i386/RPMS.extras/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/i386/RPMS.updates/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/i386/RPMS.updates/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/i386/RPMS.lvn/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/i386/RPMS.lvn/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/i386/SRPMS.lvn/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/i386/SRPMS.lvn/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/x86_64/RPMS.extras/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/x86_64/RPMS.extras/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/x86_64/RPMS.updates/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/x86_64/RPMS.updates/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/x86_64/RPMS.lvn/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/x86_64/RPMS.lvn/
rsync -alHvz --delete rsync://rpm.livna.org/rlo/fedora/$FEDORA_VERSION/x86_64/SRPMS.lvn/ $ARCHIVE_DIR/Fedora/livna.org/$FEDORA_VERSION/x86_64/SRPMS.lvn/
