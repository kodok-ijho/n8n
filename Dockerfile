FROM n8nio/n8n:latest

# Install MCP plugin langsung di image n8n
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Set working directory ke default n8n data folder
WORKDIR /data

# Expose port 5678 (default n8n port)
EXPOSE 5678

# Jalankan n8n sebagai entrypoint
ENTRYPOINT ["n8n"]
