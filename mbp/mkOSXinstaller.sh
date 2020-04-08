#!/bin/sh
SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume $DEST --applicationpath $SRCDIR/Install\ macOS\ Catalina.app/ --nointeraction
