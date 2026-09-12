#!/usr/bin/env bash
#
# create-luks-backup-disk.sh
#
# Formats a USB stick as a LUKS2-encrypted, ext4-formatted drive.
# Prompts for the device, verifies it's removable, no header backup.
#
# Usage: sudo ./create-luks-backup-disk.sh
#

set -euo pipefail

# ---- Require root ------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root." >&2
    echo "Usage: sudo $0" >&2
    exit 1
fi

# ---- Show devices and prompt --------------------------------------------
echo "=== LUKS USB Formatter ==="
echo
echo "Current block devices:"
lsblk -o NAME,SIZE,TYPE,FSTYPE,LABEL,MOUNTPOINT
echo
read -rp "Device to format (e.g. /dev/sdb): " DEVICE

# ---- Safety checks ---------------------------------------------------------
if [[ ! -b "$DEVICE" ]]; then
    echo "Error: $DEVICE is not a block device." >&2
    exit 1
fi

DEVBASE="$(basename "$DEVICE")"

# Refuse non-removable (internal) disks
if [[ -f "/sys/block/${DEVBASE}/removable" ]] && \
   [[ "$(cat "/sys/block/${DEVBASE}/removable")" == "0" ]]; then
    echo "Error: $DEVICE is a fixed (non-removable) disk." >&2
    echo "This script is intended for removable USB sticks only." >&2
    echo "If you are absolutely certain it is the right device, edit the script" >&2
    echo "and comment out this check." >&2
    exit 1
fi

# Refuse mounted devices
MOUNTED=$(lsblk -no MOUNTPOINT "$DEVICE" | grep . || true)
if [[ -n "$MOUNTED" ]]; then
    echo "Error: $DEVICE has mounted partitions:" >&2
    echo "$MOUNTED" >&2
    echo "Unmount them first, then re-run." >&2
    exit 1
fi

# ---- Confirmation -----------------------------------------------------------
echo
echo "WARNING: This will destroy all data on $DEVICE."
read -rp "Type the device name again to confirm: " CONFIRM
if [[ "$CONFIRM" != "$DEVICE" ]]; then
    echo "Aborted."
    exit 1
fi

# ---- Passphrase with verification ---------------------------------------------
while true; do
    read -rsp "LUKS passphrase: " PASS1
    echo
    read -rsp "Confirm passphrase: " PASS2
    echo
    if [[ -n "$PASS1" ]] && [[ "$PASS1" == "$PASS2" ]]; then
        break
    fi
    echo "Empty or mismatched — try again." >&2
done

# ---- Format -------------------------------------------------------------------
echo
echo "Formatting $DEVICE as LUKS2..."
cryptsetup luksFormat --type luks2 "$DEVICE"

echo "Opening container as /dev/mapper/luksusb..."
cryptsetup open "$DEVICE" luksusb

read -rp "Filesystem label (e.g. MyBackupUSB): " FSLABEL
echo "Creating ext4 filesystem (label: $FSLABEL)..."
mkfs.ext4 -L "$FSLABEL" /dev/mapper/luksusb

# ---- Cleanup ---------------------------------------------------------------------
cryptsetup close luksusb

echo
echo "Done! $DEVICE is now a LUKS2-encrypted USB stick with label '$FSLABEL'."
