FROM n8nio/n8n:latest

# Install plugin MCP
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Set working directory
WORKDIR /data

# Expose port 5678
EXPOSE 5678

# Jalankan n8n
CMD ["n8n"]
