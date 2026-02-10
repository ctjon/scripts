#!/bin/bash
# Get default GNOME Terminal profile UUID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# Set default rows and columns
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ default-size-rows 43
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ default-size-columns 120

echo "Set GNOME Terminal ($PROFILE_ID) to 43 rows and 120 columns."
