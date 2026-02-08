#!/usr/bin/env bash

set -e

SITE_SRC="$HOME/devops-web-task/site"
SITE_DST="/var/www/devops-site"
VERSION_FILE="$SITE_DST/.version"

echo "Starting deployment..."

if [ ! -d "$SITE_SRC" ]; then
    echo "Source site directory not found"
    exit 1
fi

echo "Copying site files..."
cp -r "$SITE_SRC/"* "$SITE_DST/"

echo "Saving deployment version..."
date +"%Y-%m-%d %H:%M:%S" > "$VERSION_FILE"

echo "Validating NGINX configuration..."
sudo nginx -t

echo "Reloading NGINX..."
sudo systemctl reload nginx

echo "Deployment completed successfully"
exit 0

