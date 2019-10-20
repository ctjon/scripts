#!/bin/bash
set -x

export PATH_TO_INSTALLER=/Applications
export OSX_RELEASE=Sierra
export OSX_INSTALLER=Install\ macOS\ Sierra.app

hdiutil attach "$PATH_TO_INSTALLER/$OSX_INSTALLER"/Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app
 
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o /tmp/$OSX_RELEASE
 
hdiutil resize -size 8g /tmp/$OSX_RELEASE.sparseimage
 
hdiutil attach /tmp/$OSX_RELEASE.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build
 
rm /Volumes/install_build/System/Installation/Packages
 
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/
 
hdiutil detach /Volumes/install_app
 
hdiutil detach /Volumes/install_build
 
hdiutil resize -size `hdiutil resize -limits /tmp/$OSX_RELEASE.sparseimage | tail -n 1 | awk '{ print $1 }'`b /tmp/$OSX_RELEASE.sparseimage
 
hdiutil convert /tmp/$OSX_RELEASE.sparseimage -format UDTO -o /tmp/$OSX_RELEASE
 
rm /tmp/$OSX_RELEASE.sparseimage
 
mv /tmp/$OSX_RELEASE.cdr ~/Downloads/$OSX_RELEASE.iso
