#!/bin/bash
set -x

chmod 755 /Applications/Install macOS Catalina.app/Contents/Resources/createinstallmedia

hdiutil create -o /tmp/Catalina -size 12900m -volname Catalina -layout SPUD -fs HFS+J

hdiutil attach /tmp/Catalina.dmg -noverify -mountpoint /Volumes/Catalina

sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Catalina --nointeraction

sudo hdiutil detach /Volumes/Install\ macOS\ Catalina -force

hdiutil convert /tmp/Catalina.dmg -format UDTO -o ~/Desktop/Catalina.cdr

mv ~/Desktop/Catalina.cdr ~/Desktop/Catalina.iso
