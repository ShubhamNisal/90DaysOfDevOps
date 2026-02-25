#!/bin/bash

LOG_DIR=$1

if [ -z "$LOG_DIR" ]; then
        echo "Usage: $0 /path_of_log_directory"
        exit 1

elif [ ! -d "$LOG_DIR" ]; then
        echo "Enter a valid directory path!"
        exit 1
fi

# Compress .log files older than 7 days and count them
compressed=$(find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec gzip {} \; -print | wc -l)

# Delete .gz files older than 30 days and count them
deleted=$(find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -delete -print | wc -l)

# Prints how many files were compressed and deleted
echo "Compressed $compressed files."
echo "Deleted $deleted files."