#!/usr/bin/env bash

URL="http://localhost/health.html"

if curl -fs "$URL" | grep -q "OK"; then
    exit 0
else
    exit 1
fi

