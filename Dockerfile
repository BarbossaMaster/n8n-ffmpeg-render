# Usa uma imagem base do n8n com suporte a apt
FROM n8nio/n8n:1.45.0-debian

# Instala FFmpeg
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Retorna para o usuário n8n
USER node

# Instala o nó oficial OpenAI
RUN npm install -g @n8n/nodes-openai

# Inicia o n8n
CMD ["n8n"]
