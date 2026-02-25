#!/bin/bash

set -euo pipefail

LOG_FILE="/home/ubuntu/maintenance.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

run_log_rotation() {
    log "Starting log rotation..."
    /home/ubuntu/log_rotate.sh /home/ubuntu/logs >> "$LOG_FILE" 2>&1
    log "Log rotation finished."
}

run_backup() {
    log "Starting backup..."
    /home/ubuntu/backupscript.sh /home/ubuntu/logs /home/ubuntu/backups >> "$LOG_FILE" 2>&1
    log "Backup finished."
}

main() {
    log "Maintenance started."
    run_log_rotation
    run_backup
    log "Maintenance completed successfully."
}

main