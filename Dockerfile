FROM n8nio/n8n:latest

# Install MCP plugin
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

# Install pm2 to run multiple processes
# RUN npm install -g pm2

# Copy WAHA source code
COPY waha /waha
WORKDIR /waha
RUN npm install

# Set working directory back to /data for n8n
WORKDIR /data

# Copy entrypoint
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# Expose ports
EXPOSE 5678 3000

ENTRYPOINT ["/entrypoint.sh"]
