#!/bin/bash

echo "Enter 2FA Code:"
read 2FA_Code
rclone --protondrive-2fa=$2FA_Code sync ProtonDrive:/ ~/ProtonDrive-Backup --verbose --dry-run
