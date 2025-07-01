# Usa imagem base com apt-get
FROM node:20-slim

# Instala FFmpeg e dependências básicas
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3 curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala o n8n globalmente
RUN npm install -g n8n

# Instala o nó do OpenAI correto (com namespace @n8n_io)
RUN npm install -g @n8n_io/n8n-nodes-openai

# Cria diretório de trabalho
WORKDIR /data

# Define usuário padrão
USER node

# Inicia o n8n
CMD ["n8n"]
