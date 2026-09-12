#!/usr/bin/env bash
#
# backup-vms.sh — offline backup of all libvirt VMs to the *local* Synology
#
# Invoke with: sudo -E ./backup-vms.sh   (so the ssh calls reuse your ssh-agent keys)
#
set -euo pipefail

#### Configuration ####
SYNO_USER=chris

# --- Location detection: which site am I at? ---
MY_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src"){print $(i+1);exit}}')
case "$MY_IP" in
  172.16.1.*) SYNO_HOST=synologyaz.local ;;
  172.16.2.*) SYNO_HOST=synologynd.local ;;
  *) echo "ERROR: not on a known subnet ($MY_IP). Aborting." >&2; exit 1 ;;
esac

BACKUP_SUB="vm-backups"
KEEP_BACKUPS=2                 # previous fulls to retain
SHUTDOWN_TIMEOUT=600           # seconds to wait for graceful shutdown

# --- Path layout (two forms, deliberately) ---
# Bare remote path: for commands executed ON the NAS via ssh
BACKUP_BASE="/var/services/homes/chris/Backup.$(hostname -s)"
# rsync-style destination: for rsync only
RSYNC_ROOT="$SYNO_USER@$SYNO_HOST:$BACKUP_BASE"

#### Pre-flight checks (fail fast, fail clearly) ####
if [[ $EUID -ne 0 ]]; then
    cat >&2 <<'EOF'
ERROR: this script must run as root (it controls libvirt domains).

Re-run with:   sudo -E ./backup-vms.sh
                            ^^
The -E preserves your environment (SSH_AUTH_SOCK), which lets the script's
ssh calls reuse YOUR ssh-agent keys instead of root's ~/.ssh.
EOF
    exit 1
fi

if [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
    echo "WARNING: SSH_AUTH_SOCK is not set — running without your ssh-agent." >&2
    echo "         Remote ops will try root's keys instead of yours and may fail." >&2
    echo "         Re-run with:  sudo -E $(readlink -f "$0")" >&2
    # Hard gate variant — uncomment to abort instead of warn:
    # exit 1
fi

for cmd in virsh rsync ip ssh; do
    command -v "$cmd" >/dev/null 2>&1 || {
        echo "ERROR: required tool '$cmd' not found." >&2; exit 1; }
done

if ! ssh "$SYNO_USER@$SYNO_HOST" true 2>/dev/null; then
    echo "ERROR: cannot SSH to $SYNO_USER@$SYNO_HOST. Aborting." >&2
    exit 1
fi

export LIBVIRT_DEFAULT_URI=qemu:///system
SSH="ssh $SYNO_USER@$SYNO_HOST"

if [[ -t 1 ]]; then
    RSYNC="rsync -aHS --no-o --no-g --info=progress2 -e ssh"
else
    RSYNC="rsync -aHS --no-o --no-g --info=stats2 -e ssh"
fi

#### Remote dir creation with permission normalization ####
# Synology inherits permissive ACLs from the user home into new dirs, so a
# plain mkdir yields drwxrwxrwx+. chmod after creation clamps it down.
remote_mkdir() {
    $SSH "mkdir -p '$1' && chmod 700 '$1'"
}

STAMP=$(date +%Y-%m-%d_%H%M)
REMOTE_VMROOT="$BACKUP_BASE/$BACKUP_SUB/$STAMP"          # bare path (ssh)
RSYNC_VMROOT="$RSYNC_ROOT/$BACKUP_SUB/$STAMP"            # rsync-style

# Whole path chain, each level tightened (defeats ACL inheritance dilution)
remote_mkdir "$BACKUP_BASE"
remote_mkdir "$BACKUP_BASE/$BACKUP_SUB"
remote_mkdir "$REMOTE_VMROOT"
remote_mkdir "$REMOTE_VMROOT/networks"
remote_mkdir "$REMOTE_VMROOT/pools"

#### Network + pool definitions (cheap insurance) ####
for net in $(virsh net-list --all --name); do
    virsh net-dumpxml "$net" | $SSH "cat > '$REMOTE_VMROOT/networks/${net}.xml'"
done
for pool in $(virsh pool-list --all --name); do
    virsh pool-dumpxml "$pool" | $SSH "cat > '$REMOTE_VMROOT/pools/${pool}.xml'"
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
    remote_mkdir "$REMOTE_VMROOT/$vm"
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
    virsh dumpxml "$vm" | $SSH "cat > '$REMOTE_VMROOT/$vm/domain.xml'"

    while read -r target path _; do
        [[ "$path" == /* ]] || continue    # skip empty/remote media
        echo "  copying $path"
        $RSYNC "$path" "$RSYNC_VMROOT/$vm/$(basename "$path")"
    done < <(virsh domblklist "$vm" | tail -n +3)

    # vTPM state (needed for Win11 BitLocker)
    if [[ -d "/var/lib/libvirt/qemu/${vm}-swtpm" ]]; then
        $RSYNC "/var/lib/libvirt/qemu/${vm}-swtpm" "$RSYNC_VMROOT/$vm/"
    fi

    # --- Restart if we shut it down ---
    if (( was_running )); then
        echo "  restarting..."
        virsh start "$vm"
    fi
    echo "=== $vm done ==="
done

#### Rotation: keep newest $KEEP_BACKUPS (remote-side) ####
mapfile -t old < <($SSH "cd $BACKUP_BASE/$BACKUP_SUB 2>/dev/null && ls -1dt */ | tail -n +$((KEEP_BACKUPS + 1))")
for d in "${old[@]:-}"; do
    [[ -n "$d" ]] || continue
    echo "Pruning old backup: $d"
    $SSH "rm -rf $BACKUP_BASE/$BACKUP_SUB/${d%/}"
done

echo "Backup complete: $REMOTE_VMROOT"
$SSH "du -sh $REMOTE_VMROOT"
