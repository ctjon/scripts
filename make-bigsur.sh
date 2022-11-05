#!/bin/bash
set -x

chmod 755 /Applications/Install macOS Big Sur.app/Contents/Resources/createinstallmedia

hdiutil create -o /tmp/BigSur -size 17000m -volname BigSur -layout SPUD -fs HFS+J

hdiutil attach /tmp/BigSur.dmg -noverify -mountpoint /Volumes/BigSur

sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/BigSur --nointeraction

sudo hdiutil detach /Volumes/Install\ macOS\ Big\ Sur -force

hdiutil convert /tmp/BigSur.dmg -format UDTO -o ~/Desktop/BigSur.cdr

mv ~/Desktop/BigSur.cdr ~/Desktop/BigSur.iso
