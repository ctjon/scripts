#!/usr/bin/env bash
#
# vm-backup.sh — simple offline backup of all libvirt VMs to MyBackupUSB
# Shuts down running VMs gracefully, copies everything, restarts them.
#
set -euo pipefail

#### Configuration ####
BACKUP_ROOT="/run/media/chris/MyBackupUSB"
BACKUP_SUB="vm-backups"
KEEP_BACKUPS=2                 # previous fulls to retain
SHUTDOWN_TIMEOUT=600           # seconds to wait for graceful shutdown

#### Pre-flight checks (fail fast, fail clearly) ####
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: run with sudo. Aborting." >&2; exit 1
fi
for cmd in virsh rsync findmnt; do
    command -v "$cmd" >/dev/null 2>&1 || {
        echo "ERROR: required tool '$cmd' not found." >&2; exit 1
    }
done
if ! findmnt --mountpoint "$BACKUP_ROOT" >/dev/null 2>&1; then
    echo "ERROR: '$BACKUP_ROOT' is not mounted. Aborting." >&2; exit 1
fi
export LIBVIRT_DEFAULT_URI=qemu:///system

# Progress mode: interactive runs get a live meter, scheduled runs get end-of-copy stats
if [[ -t 1 ]]; then
    RSYNC="rsync -aS --info=progress2"
else
    RSYNC="rsync -aS --info=stats2"
fi

BACKUP_DIR="$BACKUP_ROOT/$BACKUP_SUB/$(date +%Y-%m-%d_%H%M)"
mkdir -p "$BACKUP_DIR"/{networks,pools}

#### Network + pool definitions (cheap insurance) ####
for net in $(virsh net-list --all --name); do
    virsh net-dumpxml "$net" > "$BACKUP_DIR/networks/${net}.xml"
done
for pool in $(virsh pool-list --all --name); do
    virsh pool-dumpxml "$pool" > "$BACKUP_DIR/pools/${pool}.xml"
done

#### Wait for a VM to reach "shut off" ####
wait_for_shutdown() {
    local vm=$1 waited=0
    while [[ "$(virsh domstate "$vm")" != "shut off" ]]; do
        sleep 10; waited=$((waited + 10))
        if (( waited >= SHUTDOWN_TIMEOUT )); then
            echo "  WARNING: $vm did not shut down in ${SHUTDOWN_TIMEOUT}s — skipping VM." >&2
            return 1
        fi
    done
    return 0
}

#### Main loop ####
for vm in $(virsh list --all --name); do
    vm_dir="$BACKUP_DIR/$vm"
    mkdir -p "$vm_dir"
    state=$(virsh domstate "$vm")
    was_running=0
    echo "=== $vm ($state) ==="

    if [[ "$state" == "running" ]]; then
        was_running=1
        echo "  shutting down..."
        virsh shutdown "$vm"
        if ! wait_for_shutdown "$vm"; then
            continue    # leave it running, move on
        fi
    elif [[ "$state" == "shut off" ]]; then
        :
    else
        echo "  VM in odd state '$state' — skipping." >&2
        continue
    fi

    # --- VM is now offline: copy everything as plain files ---
    virsh dumpxml "$vm" > "$vm_dir/domain.xml"

    while read -r target path _; do
        [[ "$path" == /* ]] || continue    # skip empty/remote media
        echo "  copying $path"
        $RSYNC "$path" "$vm_dir/$(basename "$path")"
    done < <(virsh domblklist "$vm" | tail -n +3)

    # vTPM state (needed for Win11 BitLocker)
    if [[ -d "/var/lib/libvirt/qemu/${vm}-swtpm" ]]; then
        $RSYNC "/var/lib/libvirt/qemu/${vm}-swtpm" "$vm_dir/"
    fi

    # --- Restart if we shut it down ---
    if (( was_running )); then
        echo "  restarting..."
        virsh start "$vm"
    fi
    echo "=== $vm done ==="
done

#### Rotation: keep newest $KEEP_BACKUPS, delete older ####
cd "$BACKUP_ROOT/$BACKUP_SUB"
mapfile -t old < <(ls -1dt */ | tail -n +$((KEEP_BACKUPS + 1)))
for d in "${old[@]}"; do
    echo "Pruning old backup: $d"
    rm -rf "${d%/}"
done
cd - >/dev/null

echo "Backup complete: $BACKUP_DIR"
du -sh "$BACKUP_DIR"
