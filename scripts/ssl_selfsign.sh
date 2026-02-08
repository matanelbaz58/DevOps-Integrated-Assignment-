#!/usr/bin/env bash

set -e

SSL_DIR="/etc/nginx/ssl"
KEY_FILE="$SSL_DIR/devops-site.key"
CERT_FILE="$SSL_DIR/devops-site.crt"

sudo mkdir -p "$SSL_DIR"

sudo openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -subj "/C=IL/ST=Center/L=TelAviv/O=DevOps/CN=localhost"

sudo chmod 600 "$KEY_FILE"
sudo chmod 644 "$CERT_FILE"

echo "Self-signed SSL certificate created"
exit 0

