FROM n8nio/n8n:latest

# Install MCP plugin
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Copy WAHA source code dengan ownership node
COPY --chown=node:node waha /waha
WORKDIR /waha

# Jalankan sebagai user node dan install depedency WAHA
USER node
RUN npm install --legacy-peer-deps

# Kembali ke root dan ke direktori /data untuk n8n
USER root
WORKDIR /data

# Copy entrypoint script
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# Expose ports
EXPOSE 5678 3000

ENTRYPOINT ["/entrypoint.sh"]
