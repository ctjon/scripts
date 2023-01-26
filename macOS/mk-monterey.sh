#!/bin/sh
SRCDIR=/Volumes/4TB-NVMe/Archive/MacOSX/Apple/12.6.2-macOS-Monterey
#SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume $DEST --nointeraction
