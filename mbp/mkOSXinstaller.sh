#!/bin/sh
SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume $DEST --applicationpath $SRCDIR/Install\ macOS\ Big\ Sur.app/ --nointeraction
