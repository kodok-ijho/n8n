#!/bin/sh

echo "Starting n8n in background..."
n8n &

echo "Starting WAHA Proxy on Railway main port..."
node /waha/index.js
