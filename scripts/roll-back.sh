#!/usr/bin/env bash

set -e

SITE_DIR="/var/www/devops-site"
BACKUP_DIR="$HOME/backups"

# Find latest backup
BACKUP_FILE="$(ls -1t "$BACKUP_DIR"/devops-site_*.tar.gz 2>/dev/null | sed -n '2p')"

if [ -z "$BACKUP_FILE" ]; then
    echo "No previous backup found. Rollback aborted."
    exit 1
fi

echo "Rolling back using backup: $BACKUP_FILE"

# Clean current site
rm -rf "$SITE_DIR"/*
 
# Restore backup
tar -xzf "$BACKUP_FILE" -C "$SITE_DIR"

# Reload nginx
sudo nginx -t
sudo systemctl reload nginx

echo "Rollback completed successfully"
exit 0

