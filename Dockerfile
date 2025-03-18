FROM n8nio/n8n:latest

# Set working directory
WORKDIR /data

# Install plugin MCP sebelum menjalankan n8n
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Copy startup script dengan permission langsung
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# Expose port 5678
EXPOSE 5678

# Gunakan entrypoint custom
ENTRYPOINT ["/entrypoint.sh"]
