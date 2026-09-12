#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Proton Drive backup: $(date) ==="
echo "=== Login (used for this run only, never stored) ==="

read -rp "Username: " PROTON_USER
read -rsp "Password: " PROTON_PASS
echo ""
read -rsp "2FA code (Enter to skip if disabled): " PROTON_2FA
echo ""

export RCLONE_CONFIG_PROTONDRIVE_TYPE=protondrive
export RCLONE_CONFIG_PROTONDRIVE_USERNAME="$PROTON_USER"
export RCLONE_CONFIG_PROTONDRIVE_PASSWORD="$(rclone obscure "$PROTON_PASS")"
if [[ -n "${PROTON_2FA}" ]]; then
    export RCLONE_CONFIG_PROTONDRIVE_2FA="$PROTON_2FA"
fi

echo "=== Backup run starting ==="

FAILED=0
echo "--- Syncing /home/chris/MyDocuments -> MyDocuments.backup"
if rclone sync "/home/chris/MyDocuments" "protondrive:MyDocuments.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/MyDocuments.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] MyDocuments.backup"
else
    echo "[FAILED] MyDocuments.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/playbooks -> playbooks.backup"
if rclone sync "/home/chris/playbooks" "protondrive:playbooks.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/playbooks.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] playbooks.backup"
else
    echo "[FAILED] playbooks.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/scripts -> scripts.backup"
if rclone sync "/home/chris/scripts" "protondrive:scripts.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/scripts.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] scripts.backup"
else
    echo "[FAILED] scripts.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/HomeVideos -> HomeVideos.backup"
if rclone sync "/home/chris/HomeVideos" "protondrive:HomeVideos.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/HomeVideos.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] HomeVideos.backup"
else
    echo "[FAILED] HomeVideos.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/Books -> Books.backup"
if rclone sync "/home/chris/Books" "protondrive:Books.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/Books.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] Books.backup"
else
    echo "[FAILED] Books.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/Music -> Music.backup"
if rclone sync "/home/chris/Music" "protondrive:Music.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/Music.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] Music.backup"
else
    echo "[FAILED] Music.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/Photos -> Photos.backup"
if rclone sync "/home/chris/Photos" "protondrive:Photos.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/Photos.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] Photos.backup"
else
    echo "[FAILED] Photos.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/ApplePhotos -> ApplePhotos.backup"
if rclone sync "/home/chris/ApplePhotos" "protondrive:ApplePhotos.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/ApplePhotos.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] ApplePhotos.backup"
else
    echo "[FAILED] ApplePhotos.backup"
    FAILED=1
fi
echo "--- Syncing /home/chris/AppleMusic -> AppleMusic.backup"
if rclone sync "/home/chris/AppleMusic" "protondrive:AppleMusic.backup" \
    --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
    --backup-dir "protondrive:.trash/$(date +%F)/AppleMusic.backup" \
    --progress \
    --transfers 4 --checkers 8; then
    echo "[OK] AppleMusic.backup"
else
    echo "[FAILED] AppleMusic.backup"
    FAILED=1
fi

# Prune trash older than 60 days
echo "Pruning trash older than 60 days"
if rclone delete "protondrive:.trash" --min-age 60d --rmdirs; then
    echo "Trash pruning OK"
else
    echo "Trash pruning FAILED"
    FAILED=1
fi

echo "=== Backup run finished (failed=$FAILED) ==="
exit $FAILED
