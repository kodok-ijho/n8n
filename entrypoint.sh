#!/bin/sh

echo "Installing MCP plugin..."
npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

echo "Starting WAHA Proxy..."
node /waha/index.js &

echo "Starting n8n (proxied via /n8n)..."
exec n8n
