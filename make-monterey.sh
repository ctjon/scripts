#!/bin/bash
set -x

chmod 755 /Applications/Install macOS Monterey.app/Contents/Resources/createinstallmedia

hdiutil create -o /tmp/Monterey -size 17000m -volname Monterey -layout SPUD -fs HFS+J

hdiutil attach /tmp/Monterey.dmg -noverify -mountpoint /Volumes/Monterey

sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/Monterey --nointeraction

sudo hdiutil detach /Volumes/Install\ macOS\ Monterey -force

hdiutil convert /tmp/Monterey.dmg -format UDTO -o ~/Desktop/Monterey.cdr

mv ~/Desktop/Monterey.cdr ~/Desktop/Monterey.iso
