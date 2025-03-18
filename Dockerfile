FROM n8nio/n8n:latest

# Set working directory
WORKDIR /data

# Install plugin MCP sebelum menjalankan n8n
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Copy startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 5678
EXPOSE 5678

# Gunakan entrypoint custom
ENTRYPOINT ["/entrypoint.sh"]
