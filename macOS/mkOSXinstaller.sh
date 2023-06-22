#!/bin/sh
#SRCDIR=/Volumes/Archive/MacOSX/Apple/13.2.1-macOS-Ventura
SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume $DEST --nointeraction
