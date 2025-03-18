#!/bin/sh
echo "Installing MCP plugin..."
npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

echo "Starting n8n..."
exec n8n
