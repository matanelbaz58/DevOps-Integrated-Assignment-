#!/usr/bin/env bash

set -e

SRC="/var/www/devops-site"
BACKUP_DIR="$HOME/backups"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_NAME="devops-site_${TIMESTAMP}.tar.gz"

# Ensure source exists
if [ ! -d "$SRC" ]; then
    echo "Source directory does not exist"
    exit 1
fi

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SRC" .

# Keep only last 5 backups
ls -1t "$BACKUP_DIR"/devops-site_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm --

echo "Backup created: $BACKUP_DIR/$BACKUP_NAME"
exit 0

