#!/bin/bash
set -x

# Mount the installer image
hdiutil attach /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app

# Convert the boot image to a sparse bundle
hdiutil convert /Volumes/install_app/BaseSystem.dmg -format UDSP -o ~/Downloads/ElCapitan

# Increase the sparse bundle capacity to accommodate the packages
hdiutil resize -size 8g ~/Downloads/ElCapitan.sparseimage

# Mount the sparse bundle for package addition
hdiutil attach ~/Downloads/ElCapitan.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build

# Remove Package link and replace with actual files
rm /Volumes/install_build/System/Installation/Packages
cp -rp /Volumes/install_app/Packages /Volumes/install_build/System/Installation/

# Copy ElCapitan installer dependencies
cp -rp /Volumes/install_app/BaseSystem.chunklist /Volumes/install_build/BaseSystem.chunklist
cp -rp /Volumes/install_app/BaseSystem.dmg /Volumes/install_build/BaseSystem.dmg

# Unmount the installer image
hdiutil detach /Volumes/install_app

# Unmount the sparse bundle
hdiutil detach /Volumes/install_build

# Resize the partition in the sparse bundle to remove any free space
hdiutil resize -size `hdiutil resize -limits ~/Downloads/ElCapitan.sparseimage | tail -n 1 | awk '{ print $1 }'`b ~/Downloads/ElCapitan.sparseimage

# Convert the sparse bundle to ISO/CD master
hdiutil convert ~/Downloads/ElCapitan.sparseimage -format UDTO -o ~/Downloads/ElCapitan

# Remove the sparse bundle
rm ~/Downloads/ElCapitan.sparseimage

# Rename the ISO and move it to the desktop
mv ~/Downloads/ElCapitan.cdr ~/Downloads/ElCapitan.iso
