#!/bin/bash

LOG_FILE="/var/log/backup_script.log"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory> [--compress]"
    exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"
COMPRESS_FLAG="$3"

if [ ! -d "$SOURCE_DIR" ]; then
    log_message "ERROR: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    if [ $? -ne 0 ]; then
        log_message "ERROR: Failed to create destination directory '$DEST_DIR'."
        exit 1
    fi
    log_message "INFO: Created destination directory '$DEST_DIR'."
fi

BACKUP_NAME="backup_$(date '+%Y%m%d_%H%M%S')"

if [ "$COMPRESS_FLAG" == "--compress" ]; then
    TAR_FILE="${DEST_DIR}/${BACKUP_NAME}.tar.gz"
    tar -czf "$TAR_FILE" -C "$SOURCE_DIR" .
    if [ $? -eq 0 ]; then
        log_message "SUCCESS: Compressed backup created at '$TAR_FILE'."
    else
        log_message "ERROR: Failed to create compressed backup."
        exit 1
    fi
else
    BACKUP_DIR="${DEST_DIR}/${BACKUP_NAME}"
    cp -r "$SOURCE_DIR" "$BACKUP_DIR"
    if [ $? -eq 0 ]; then
        log_message "SUCCESS: Files copied to '$BACKUP_DIR'."
    else
        log_message "ERROR: Failed to copy files."
        exit 1
    fi
fi

log_message "INFO: Cleaning up backups older than 7 days in '$DEST_DIR'."
find "$DEST_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;
find "$DEST_DIR" -type d -name "backup_*" -mtime +7 -exec rm -rf {} \;

log_message "INFO: Cleanup completed."

exit 0
