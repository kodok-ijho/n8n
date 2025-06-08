FROM n8nio/n8n:latest

# Install MCP plugin
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Copy WAHA source code
COPY waha /waha
WORKDIR /waha

# Ubah ownership folder ke user 'node' supaya bisa npm install
RUN chown -R node:node /waha

# Jalankan npm install sebagai user node
USER node
RUN npm install --legacy-peer-deps

# Balik lagi ke user root dan ke /data untuk n8n
USER root
WORKDIR /data

# Copy entrypoint script
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# Expose ports
EXPOSE 5678 3000

ENTRYPOINT ["/entrypoint.sh"]
