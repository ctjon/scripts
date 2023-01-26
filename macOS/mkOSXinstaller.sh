#!/bin/sh
SRCDIR=/Volumes/4TB-NVMe/Archive/MacOSX/Apple/13.1.0-macOS-Ventura
#SRCDIR=/Applications
#SRCDIR=/Users/chris/Downloads
DEST=/Volumes/Untitled

sudo $SRCDIR/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume $DEST --nointeraction
