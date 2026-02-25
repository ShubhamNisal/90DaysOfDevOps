#!/bin/bash

set -euo pipefail

# === Functions ===

usage() {
    echo "Usage: $0 <source_directory> <backup_destination>"
    exit 1
}

check_source() {
    local src="$1"
    if [ ! -d "$src" ]; then
        echo "Error: Source directory '$src' does not exist."
        exit 1
    fi
}

create_backup() {
    local src="$1"
    local dest="$2"
    local timestamp
    timestamp=$(date +"%Y-%m-%d")
    local archive_name="backup-$timestamp.tar.gz"
    local archive_path="$dest/$archive_name"

    mkdir -p "$dest"
    tar -czf "$archive_path" -C "$src" .

    echo "$archive_path"
}

verify_backup() {
    local archive="$1"
    if [ -f "$archive" ]; then
        local size
        size=$(du -h "$archive" | cut -f1)
        echo "Backup created successfully: $(basename "$archive")"
        echo "Size: $size"
    else
        echo "Error: Backup archive was not created."
        exit 1
    fi
}

cleanup_old_backups() {
    local dest="$1"
    local deleted_count
    deleted_count=$(find "$dest" -name "backup-*.tar.gz" -type f -mtime +14 | wc -l)

    if [ "$deleted_count" -gt 0 ]; then
        find "$dest" -name "backup-*.tar.gz" -type f -mtime +14 -exec rm -f {} \;
        echo "Deleted $deleted_count old backup(s) older than 14 days."
    else
        echo "No old backups to delete."
    fi
}

# === Main Script ===

if [ "$#" -ne 2 ]; then
    usage
fi

SOURCE_DIR="$1"
DEST_DIR="$2"

check_source "$SOURCE_DIR"
ARCHIVE_PATH=$(create_backup "$SOURCE_DIR" "$DEST_DIR")
verify_backup "$ARCHIVE_PATH"
cleanup_old_backups "$DEST_DIR"