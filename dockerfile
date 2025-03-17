FROM n8nio/n8n:latest
RUN npm install --unsafe-perm=true --allow-root n8n-nodes-mcp
WORKDIR /data
CMD ["n8n"]
