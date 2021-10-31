#!/bin/sh
SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume $DEST --applicationpath $SRCDIR/Install\ macOS\ Monterey.app/ --nointeraction
