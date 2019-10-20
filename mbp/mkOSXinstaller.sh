#!/bin/sh
SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume $DEST --applicationpath $SRCDIR/Install\ macOS\ High\ Sierra.app/ --nointeraction
