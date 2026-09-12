
#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TREES_FILE="$SCRIPT_DIR/backup-trees.txt"
HOSTNAME="$(hostname -s)"
BACKUP_ROOT="protondrive:${HOSTNAME}.backup"

if [[ ! -r "$TREES_FILE" ]]; then
    echo "ERROR: tree list not found or unreadable: $TREES_FILE" >&2
    exit 2
fi

echo "=== Proton Drive backup: $(date) ==="
echo "=== Host: $HOSTNAME (backing up to $BACKUP_ROOT) ==="
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

# Load tree list: lines of "<local path> | <remote name>", '#' comments OK
TREES=()
while IFS= read -r line || [[ -n "$line" ]]; do
    # trim leading/trailing whitespace
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" || "$line" == \#* ]] && continue
    if [[ "$line" != *"|"* ]]; then
        echo "WARNING: skipping malformed line (no '|'): $line" >&2
        continue
    fi
    TREES+=("$line")
done < "$TREES_FILE"

if [[ ${#TREES[@]} -eq 0 ]]; then
    echo "ERROR: no valid trees found in $TREES_FILE" >&2
    exit 2
fi

for tree_line in "${TREES[@]}"; do
    local_path="${tree_line%%|*}"
    remote_name="${tree_line##*|}"
    local_path="${local_path#"${local_path%%[![:space:]]*}"}"
    local_path="${local_path%"${local_path##*[![:space:]]}"}"
    remote_name="${remote_name#"${remote_name%%[![:space:]]*}"}"
    remote_name="${remote_name%"${remote_name##*[![:space:]]}"}"
    local_path="${local_path//\~/$HOME}"

    if [[ ! -d "$local_path" ]]; then
        echo "[FAILED] $remote_name: local path does not exist: $local_path"
        FAILED=1
        continue
    fi

    echo "--- Syncing $local_path -> $BACKUP_ROOT/$remote_name"
    if rclone sync "$local_path" "$BACKUP_ROOT/$remote_name" \
        --exclude-from "$SCRIPT_DIR/backup-excludes.txt" \
        --backup-dir "$BACKUP_ROOT/.trash/$remote_name/$(date +%F)" \
        --progress \
        --transfers 4 --checkers 8; then
        echo "[OK] $remote_name"
    else
        echo "[FAILED] $remote_name"
        FAILED=1
    fi
done

# Prune each tree's trash older than 60 days (skip if no trash exists yet)
for tree_line in "${TREES[@]}"; do
    remote_name="${tree_line##*|}"
    remote_name="${remote_name#"${remote_name%%[![:space:]]*}"}"
    remote_name="${remote_name%"${remote_name##*[![:space:]]}"}"
    TRASH="$BACKUP_ROOT/.trash/$remote_name"
    if rclone lsf "$TRASH" --max-depth 1 >/dev/null 2>&1; then
        echo "Pruning trash older than 60 days: $TRASH"
        if rclone delete "$TRASH" --min-age 60d && rclone rmdirs "$TRASH"; then
            echo "Trash pruning OK: $remote_name"
        else
            echo "Trash pruning FAILED: $remote_name"
            FAILED=1
        fi
    else
        echo "No trash yet for: $remote_name (nothing to prune)"
    fi
done

echo "=== Backup run finished (failed=$FAILED) ==="
exit $FAILED
