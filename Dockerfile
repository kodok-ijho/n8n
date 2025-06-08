FROM n8nio/n8n:latest

RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp

COPY --chown=node:node waha /waha
WORKDIR /waha

USER node
RUN npm install --legacy-peer-deps

USER root
WORKDIR /data

COPY --chmod=755 entrypoint.sh /entrypoint.sh

# ❌ Hapus port 5678, cukup port proxy-nya (Express WAHA)
EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
